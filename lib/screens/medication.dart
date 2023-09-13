import 'package:flutter/material.dart';

import '../widgets/navigation_drawer.dart';

class Medications extends StatelessWidget {
  const Medications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Medication',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff13bcfb),
      ),
      body: Center(
        child: Text("All your Medications will be here"),
      ),
      drawer: const CustomNavigationDrawer(),
    );
  }
}
