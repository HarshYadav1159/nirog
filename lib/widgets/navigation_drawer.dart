import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projects/screen_routes.dart';
import 'package:projects/screens/user_detail_screen.dart';
import 'package:projects/widgets/first_page.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/home_screen_provider.dart';

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
          children: [
            Container(
              color: Colors.lightBlue,
              padding: EdgeInsets.only(
                  top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
              child: Column(
                children: [
                  Container(
                    child: Image.asset('assets/images/profile.png'),
                    height: 108,
                    width: 108,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  FutureBuilder(
                      future: context.read<HomeScreenProvider>().readUser(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final user = snapshot.data;
                          return user == null
                              ? Center(
                                  child: Text("No User"),
                                )
                              : Column(
                                  children: [
                                    Text(user.name!),
                                    SizedBox(height: 2),
                                    Text(user.phone!.toString())
                                  ],
                                );
                        } else {
                          return SizedBox();
                        }
                      })
                ],
              ),
            ),
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: Text("Home"),
                  onTap: () {
                    FirstPage.selectedPageIndex=0;
                    Navigator.pushNamed(context, firstPage);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person_2_rounded),
                  title: Text("Profile"),
                  onTap: () {
                   FirstPage.selectedPageIndex=4;
                    Navigator.pushNamed(context, firstPage);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.medical_information),
                  title: Text("Diagnostics"),
                  onTap: () {
                    FirstPage.selectedPageIndex = 1;
                    Navigator.pushNamed(context, firstPage);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.health_and_safety_outlined),
                  title: Text("Tests"),
                  onTap: () {
                    FirstPage.selectedPageIndex = 3;
                    Navigator.pushNamed(context, firstPage);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.healing_rounded),
                  title: Text("Medication"),
                  onTap: () {
                    FirstPage.selectedPageIndex = 2;
                    Navigator.pushNamed(context, firstPage);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: Text("Logout"),
                  onTap: () {
                    Navigator.pushNamed(context, firstPage);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
