import 'package:flutter/material.dart';

import '../widgets/navigation_drawer.dart';

class Tests extends StatelessWidget {
  const Tests({super.key});

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
        child: Text("All your Tests will be here"),
      ),
      drawer: const CustomNavigationDrawer(),
    );
  }
}
