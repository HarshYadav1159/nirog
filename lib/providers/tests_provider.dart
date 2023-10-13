import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projects/models/test_model.dart';
import 'package:projects/screens/registration_screens/login_screen.dart';

class TestProvider with ChangeNotifier{

  String userId = LoginScreen.p;

  Stream<List<TestModel>> readTests(){
    print(userId);
    Stream<List<TestModel>> snapshot =  FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .collection('test').snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => TestModel.fromJson(doc.data())).toList());

    return snapshot;
  }
}