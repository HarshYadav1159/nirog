import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../widgets/navigation_drawer.dart';

class Diagnostics extends StatefulWidget {
  const Diagnostics({super.key});

  @override
  State<Diagnostics> createState() => _DiagnosticsState();
}

class _DiagnosticsState extends State<Diagnostics> {

  TextEditingController diagNameController = TextEditingController();
  TextEditingController docNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nirog',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: const Center(
        child: Text("All your Diagnostics will be here"),
      ),
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
        builder: (context) => AlertDialog(
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Icon(Icons.camera_alt_outlined)),
                      SizedBox(width: 12,),
                      TextButton(onPressed: (){}, child:Text("Upload From Gallery"))
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
                TextButton(onPressed: () {
                  final diagName = diagNameController.text;
                  final docName = docNameController.text;

                  createUser(diagName: diagName,docName: docName);

                }, child: Text("Submit"))
              ],
            ));
  }

  Future createUser({required String diagName,required String docName}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc('0000').collection('diagnosis').doc();

    final json = {
      'diagnosisName' : diagName,
      'docName' : docName,
      'age' : 21,
    };
    await docUser.set(json);
  }
}
