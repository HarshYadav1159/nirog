import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projects/screens/image_display_screen.dart';
import 'package:projects/screens/registration_screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:projects/providers/diagnosis_provider.dart';
import '../models/diagnostics_model.dart';
import '../widgets/navigation_drawer.dart';

class Diagnostics extends StatefulWidget {
  const Diagnostics({super.key});

  @override
  State<Diagnostics> createState() => _DiagnosticsState();
}

class _DiagnosticsState extends State<Diagnostics> {
  TextEditingController diagNameController = TextEditingController();
  TextEditingController docNameController = TextEditingController();
  XFile? file;

  late DateTime dateTime;
  @override
  void initState() {

    dateTime = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Diagnostics',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder<List<DiagnosticsModel>>(
          stream: context.read<DiagnosticsProvider>().readDiagnostics(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text("Some Error Occured"));
            } else if (snapshot.hasData) {
              final diagnosis = snapshot.data!;
              print("Data is there");
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: diagnosis.map(diagnosisCard).toList(),
                ),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: Text("No Record Found"),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      drawer: const CustomNavigationDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDialog(context);
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> openDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: const Text('Diagnosis Details'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: "Diagnosis Name"),
                    controller: diagNameController,
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(hintText: "Enter Doc's Name"),
                    controller: docNameController,
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                          onPressed: () async {
                            final result = await showDatePicker(context: context,
                                initialDate: dateTime,
                                firstDate: DateTime(1960),
                                lastDate: DateTime.now());

                            if(result!=null){
                              setState(() {
                                dateTime = result;
                              });
                            }
                            print(dateTime);
                          }, child: Icon(Icons.calendar_month)),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width - 200,
                        child: Text(dateTime.toString()),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                          onPressed: () async {
                            ImagePicker imagePicker = ImagePicker();
                            file = await imagePicker.pickImage(
                                source: ImageSource.camera);
                          },
                          child: const Icon(Icons.camera_alt_outlined)),
                      const SizedBox(
                        width: 12,
                      ),
                      TextButton(
                          onPressed: () {
                            // ImagePicker imagePicker = ImagePicker();
                            // imagePicker.pickImage(source: ImageSource.gallery);
                          },
                          child: Text("Upload From Gallery"))
                    ],
                  )
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                TextButton(
                    onPressed: () async {
                      final diagName = diagNameController.text;
                      final docName = docNameController.text;
                      String? imageUrl;

                      if (file != null) {
                        String uniqueFileName =
                        DateTime
                            .now()
                            .microsecondsSinceEpoch
                            .toString();
                        Reference referenceRoot =
                        FirebaseStorage.instance.ref();
                        Reference referenceDirImages = referenceRoot.child(
                            'images/${LoginScreen.p}/diagnosisImages/$diagName');

                        Reference referenceImageToUpload =
                        referenceDirImages.child(uniqueFileName);
                        //Get url link
                        try {
                          //Store the file
                          await referenceImageToUpload
                              .putFile(File(file!.path));
                          //Get link
                          imageUrl =
                          await referenceImageToUpload.getDownloadURL();
                        } catch (error) {
                          print("Error in Upload");
                        }
                      }
                      context.read<DiagnosticsProvider>().createDiagnostics(
                          diagName: diagName,
                          docName: docName,
                          imageUrl: imageUrl,
                          dateTime : dateTime.toString());

                      Navigator.pop(context);
                      file = null;
                      imageUrl = null;
                    },
                    child: const Text("Submit"))
              ],
            ));
  }

  Widget diagnosisCard(DiagnosticsModel diagnosticsModel) =>
  Padding(
    padding: const EdgeInsets.all(10.0),
    child: InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ImageScreen(imageUrl: diagnosticsModel.imageUrl,name: diagnosticsModel.diagnosisName)),
        );
      },
      child: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.5,
              // color: Colors.grey,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(blurRadius: 0.5),
                ],
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, bottom: 8.0),
                          child: Text(
                            "Dr. ${diagnosticsModel.doctorName!}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,bottom: 20.0),
                    child: Text(
                      diagnosticsModel.diagnosisName!,
                      style:
                      TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                  ),
                  Center(child:Padding(
                    padding: const EdgeInsets.only(top: .0),
                    child: Container(
                      height: MediaQuery.sizeOf(context).height/6,
                      width: MediaQuery.sizeOf(context).width/1.6,
                      // color: Colors.blue,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                        image: DecorationImage(
                          image: NetworkImage("${diagnosticsModel.imageUrl}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
