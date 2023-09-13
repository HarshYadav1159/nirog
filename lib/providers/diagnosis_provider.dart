import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projects/models/diagnostics_model.dart';
import 'package:projects/screens/registration_screens/login_screen.dart';

class DiagnosticsProvider with ChangeNotifier {
  String userId = LoginScreen.p;

  //Write Data
  Future createDiagnostics(
      {required String diagName, required String docName, String? imageUrl, required String dateTime}) async {
    final docUser = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('diagnosis')
        .doc();
    final diagnostics =
    DiagnosticsModel(diagnosisName: diagName, doctorName: docName,imageUrl: imageUrl,date: dateTime);
    final diagnosticsJson = diagnostics.toJson();
    await docUser.set(diagnosticsJson);
  }

  //Read Data
  Stream<List<DiagnosticsModel>> readDiagnostics(){
    Stream<List<DiagnosticsModel>> snapshot =  FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('diagnosis').orderBy('date',descending: true).snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => DiagnosticsModel.fromJson(doc.data())).toList());

    return snapshot;
  }
}
