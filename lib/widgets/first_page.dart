
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/screens/diagnostics_screen.dart';
import 'package:projects/screens/tests_screen.dart';

import '../screen_routes.dart';
import '../screens/home_screen.dart';
import '../screens/medication.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List <Widget> screens=[
    MyHomePage(),
    Diagnostics(),
    Medications(),
    Tests()
  ];
  int currentTab = 0;
  int selectedPageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  void selectPage(int i){
    setState(() {
      selectedPageIndex=i;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: screens[selectedPageIndex],
      bottomNavigationBar: BottomAppBar(
        // color: Colors.black,
        child: Container(
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color(0xff13bcfb),
          ),
          height: 50,
          width: 80,
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: ()=>{selectPage(0)},
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: selectedPageIndex == 0?Colors.white:Colors.white70,
                ),
              ),

              TextButton(
                onPressed: ()=>selectPage(1),
                child: Icon(
                  Icons.medical_information,
                  size: 30,
                    color: selectedPageIndex == 1?Colors.white:Colors.white70
                ),
              ),

              TextButton(
                onPressed: ()=>{selectPage(2)},
                child: Icon(
                  Icons.health_and_safety,
                  size: 30,
                    color: selectedPageIndex == 2?Colors.white:Colors.white70,
                ),
              ),
              TextButton(
                onPressed: ()=>{selectPage(3)},
                child: Icon(
                  Icons.healing_rounded,
                  size: 30,
                    color: selectedPageIndex == 3?Colors.white:Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
