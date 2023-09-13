


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/screens/diagnostics_screen.dart';
import 'package:projects/screens/tests_screen.dart';

import '../screen_routes.dart';
import '../screens/profile_screen.dart';
import '../screens/medication.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);
  static int selectedPageIndex = 0;
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List <Widget> screens=[
    Diagnostics(),
    Medications(),
    Tests(),
    ProfileScreen()
  ];
  int currentTab = 0;

  final PageController _pageController = PageController(initialPage: 0);
  void selectPage(int i){
    setState(() {
      FirstPage.selectedPageIndex=i;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screens[FirstPage.selectedPageIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(35)),
            color: Color(0xff13bcfb),
          ),
          height: 70,
          width: 90,
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: ()=>selectPage(0),
                child: Icon(
                  Icons.medical_information,
                  size: 30,
                    color: FirstPage.selectedPageIndex == 0?Colors.white:Colors.white70
                ),
              ),

              TextButton(
                onPressed: ()=>{selectPage(1)},
                child: Icon(
                  Icons.health_and_safety,
                  size: 30,
                    color: FirstPage.selectedPageIndex == 1?Colors.white:Colors.white70,
                ),
              ),
              TextButton(
                onPressed: ()=>{selectPage(2)},
                child: Icon(
                  Icons.healing_rounded,
                  size: 30,
                    color: FirstPage.selectedPageIndex == 2?Colors.white:Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
