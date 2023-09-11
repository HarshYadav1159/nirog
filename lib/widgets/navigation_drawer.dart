import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projects/screen_routes.dart';

import '../models/user.dart';

class CustomNavigationDrawer extends StatefulWidget {
  const CustomNavigationDrawer({super.key});

  @override
  State<CustomNavigationDrawer> createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
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
            FutureBuilder<UserModel>(
                future: readUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print("The name is : ${snapshot.data?.name}");
                    return Text('Unable to Load User Name');
                  } else if (snapshot.hasData) {
                    final user = snapshot.data;
                    return user == null
                        ? Text("No User")
                        : Text(
                            user.name!,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          );
                  } else {
                    return SizedBox();
                  }
                }),
            FutureBuilder<UserModel>(
                future: readUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Unable to Load Number Name');
                  } else if (snapshot.hasData) {
                    final user = snapshot.data;
                    return user == null
                        ? Text("No User")
                        : Text(
                            user.phone!.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          );
                  } else {
                    return SizedBox();
                  }
                }),
          ],
        ),
      );

  Widget buildMenuItems(context) => Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person_2_rounded),
            title: Text("Profile"),
            onTap: () {
              Navigator.pushNamed(context, homeScreen);
            },
          ),
          ListTile(
            leading: const Icon(Icons.medical_information),
            title: Text("Diagnostics"),
            onTap: () {
              Navigator.pushNamed(context, diagnosticScreen);
            },
          ),
          ListTile(
            leading: const Icon(Icons.health_and_safety_outlined),
            title: Text("Tests"),
            onTap: () {
              Navigator.pushNamed(context, testScreen);
            },
          ),
          ListTile(
            leading: const Icon(Icons.healing_rounded),
            title: Text("Medication"),
            onTap: () {
              Navigator.pushNamed(context, medicationScreen);
            },
          ),
        ],
      );
}

Future<UserModel> readUser() async {
  String userId = "8770805985";
  final docUser =
      FirebaseFirestore.instance.collection('users').doc(userId);
  final snapshot = await docUser.get();
  if (snapshot.exists) {
    print("Doesnot exist");
    return UserModel.fromJson(snapshot.data()!);
  }
  throw (Exception e) {
    print("Unable To Return User Data");
  };
}
