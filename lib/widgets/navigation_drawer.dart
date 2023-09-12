import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projects/screen_routes.dart';

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
            Text("Yuvraj Bhadoria",style: TextStyle(color: Colors.white,fontSize: 20),),
            Text("Nirog ID : 000000",style: TextStyle(color: Colors.white),),
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
        ],
      );
}
