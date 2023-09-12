import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projects/screens/registration_screens/login_screen.dart';
import 'package:projects/screens/user_detail_screen.dart';

import '../widgets/navigation_drawer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users/${UserDetails.p}').snapshots(),
    builder:(context,AsyncSnapshot<QuerySnapshot> streamSnapshot) {
    if (streamSnapshot.connectionState == ConnectionState.waiting) {
    return const Center(child: CircularProgressIndicator());
    }
    else {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nirog',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Text("Hi Patient!"),
      ),
      drawer: const CustomNavigationDrawer(),
    );
  }
});
  }
}