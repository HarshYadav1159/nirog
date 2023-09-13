import 'package:flutter/material.dart';
import 'package:projects/providers/home_screen_provider.dart';
import 'package:projects/screen_routes.dart';
import 'package:provider/provider.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

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
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: Text("Logout"),
                  onTap: () {
                    Navigator.pushNamed(context, loginScreen);
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
