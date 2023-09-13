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
  // late String formattedDate;

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
          'Diagnosis',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff13bcfb),
      ),
      body: StreamBuilder<List<DiagnosticsModel>>(
          stream: context.read<DiagnosticsProvider>().readDiagnostics(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text("Some Error Occured"));
            } else if (snapshot.hasData) {
              final diagnosis = snapshot.data!;
              return ListView(
                children: diagnosis.map(diagnosisCard).toList(),
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
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ImageScreen(
                      imageUrl: diagnosticsModel.imageUrl,
                    )),
          );
        },
        child: Card(
          child: ListTile(
            leading: const Icon(Icons.medication_liquid_rounded),
            title: Text(diagnosticsModel.diagnosisName!),
            subtitle: Text(diagnosticsModel.doctorName!),
          ),
        ),
      );
}
