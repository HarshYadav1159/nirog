import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projects/screens/user_detail_screen.dart';

import '../models/user.dart';
import '../screens/registration_screens/login_screen.dart';

class HomeScreenProvider with ChangeNotifier{

  Future<UserModel> readUser() async {
    String id = LoginScreen.p;
    final docUser = FirebaseFirestore.instance.collection('users').doc(id);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      UserModel user = UserModel.fromJson(snapshot.data()!);
      UserDetails.userName = user.name!;
      return user;
    }
    throw {
      print("Error Fetching User data")
    };
  }

}