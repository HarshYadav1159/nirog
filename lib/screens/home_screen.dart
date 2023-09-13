import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projects/providers/home_screen_provider.dart';
import 'package:projects/screens/registration_screens/login_screen.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../widgets/navigation_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nirog',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: FutureBuilder(future: readUser(), builder: (context, snapshot) {
          if (snapshot.hasData) {
            final user = snapshot.data;
            return user == null
                ? Center(child: CircularProgressIndicator(),)
                : Text("Hi ${user.name.toString()}");
          }else{
            return SizedBox();
          }
        }),
      ),
      drawer: const CustomNavigationDrawer(),
    );
  }

  Future<UserModel> readUser() async {
    String id = LoginScreen.p;
    final docUser = FirebaseFirestore.instance.collection('users').doc(id);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return UserModel.fromJson(snapshot.data()!);
    }
    throw{
    print("Error Fetching Data")
    };
  }
}