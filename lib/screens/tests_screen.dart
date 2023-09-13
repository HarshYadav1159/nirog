import 'package:flutter/material.dart';

import '../widgets/navigation_drawer.dart';

class Tests extends StatelessWidget {
  const Tests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tests',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:Color(0xff13bcfb),
      ),
      body: Center(
        child: Text("All your Tests will be here"),
      ),
      drawer: const CustomNavigationDrawer(),
    );
  }
}
