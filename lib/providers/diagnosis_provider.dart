import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projects/models/diagnostics_model.dart';

class DiagnosticsProvider with ChangeNotifier {
  String userId = "8770805985";

  //Write Data
  Future createDiagnostics(
      {required String diagName, required String docName, String? imageUrl}) async {
    final docUser = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('diagnosis')
        .doc();
    final diagnostics =
        DiagnosticsModel(diagnosisName: diagName, doctorName: docName,imageUrl: imageUrl);
    final diagnosticsJson = diagnostics.toJson();
    await docUser.set(diagnosticsJson);
  }

  //Read Data
  Stream<List<DiagnosticsModel>> readDiagnostics(){
    Stream<List<DiagnosticsModel>> snapshot =  FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('diagnosis').snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => DiagnosticsModel.fromJson(doc.data())).toList());

    return snapshot;
  }
}
