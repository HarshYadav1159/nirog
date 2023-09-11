import 'package:flutter/material.dart';

import '../widgets/navigation_drawer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
        child: Text("Hi Yuvraj!"),
      ),
      drawer: const CustomNavigationDrawer(),
    );
  }
}