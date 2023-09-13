import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projects/screen_routes.dart';
import 'package:projects/screens/registration_screens/login_screen.dart';
import 'package:projects/screens/user_detail_screen.dart';

import '../models/user.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [buildHeader(context), buildMenuItems(context)],
        ),
      ),
    );
  }

  Widget buildHeader(context) => Container(
    padding: EdgeInsets.only(
        top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
    color: Colors.lightBlue,
    child: Column(
      children: [
        Container(
          child: Image.asset('assets/images/profile.png'),
          height: 108,
          width: 108,
        ),
        SizedBox(height: 12),
        // FutureBuilder(future: readUser(), builder: (context,snapshot){
        //   if(snapshot.hasData){
        //     final user = snapshot.data;
        //
        //     return user == null ? Center(child: Text('No User'),) : Text(user.name!);
        //   }else{
        //     return SizedBox();
        //   }
        // }),
        // FutureBuilder(future: readUser(), builder: (context,snapshot){
        //   if(snapshot.hasData){
        //     final user = snapshot.data;
        //
        //     return user == null ? Center(child: Text('No User'),) : Text(user.phone!.toString());
        //   }else{
        //     return SizedBox();
        //   }
        // })
      ],
    ),
  );

  //TODO : Implement OnTap
  Widget buildMenuItems(context) => Column(
    children: [
      ListTile(
        leading: const Icon(Icons.person_2_rounded),
        title: Text("Profile"),
        onTap: () {Navigator.pushNamed(context, homeScreen);},
      ),
      ListTile(
        leading: const Icon(Icons.medical_information),
        title: Text("Diagnostics"),
        onTap: () {Navigator.pushNamed(context, diagnosticScreen);},
      ),
      ListTile(
        leading: const Icon(Icons.health_and_safety_outlined),
        title: Text("Tests"),
        onTap: () {

          Navigator.pushNamed(context, testScreen);},
      ),
      ListTile(
        leading: const Icon(Icons.healing_rounded),
        title: Text("Medication"),
        onTap:() {Navigator.pushNamed(context, medicationScreen);},
      ),
      ListTile(
        leading: const Icon(Icons.logout),
        title: Text("Logout"),
        onTap:() {Navigator.pushNamed(context, loginScreen);},
      ),
    ],
  );

  Future<UserModel> readUser() async {
    String id = LoginScreen.p;
    final docUser = FirebaseFirestore.instance.collection('users').doc(id);
    final snapshot = await docUser.get();

    if(snapshot.exists){
      return UserModel.fromJson(snapshot.data()!);
    }
    throw{
      print("Error Fetching User data")
    };
  }
}
