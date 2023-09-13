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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Nirog',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          // SizedBox(height: 12),
          Center(child:
          Container(

            decoration: BoxDecoration(
              // borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.lightBlue,

            ),
            alignment: Alignment.center,

            child: Column(
              children: [
                SizedBox(height: 12),
                Container(
                  height:120,
                    width:MediaQuery.of(context).size.width,
                    child:Image.asset('assets/images/profile.png')),
                Text("Name: Jai Kumar",style: TextStyle(fontSize: 16),),
                Text("Phone Number: 82XXXXXXX0",style: TextStyle(fontSize: 16),),
                Text("ABHA ID: 465ERDH",style: TextStyle(fontSize: 16),),
              ],
            ),
            height: 250,
            width:MediaQuery.of(context).size.width,
          ),),
          SizedBox(height: 20),
          Container(
            color: Colors.red,
            child: Column(

              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 150,
                      child: Text("Gender:",style: TextStyle(fontSize: 16),),
                    ),
                    SizedBox(width: 50,),
                    Container(
                      alignment: Alignment.center,
                      child: Text("Male",style: TextStyle(fontSize: 16),),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 150,
                      child: Text("Blood Group:",style: TextStyle(fontSize: 16),),
                    ),
                    SizedBox(width: 50,),
                    Container(
                      alignment: Alignment.center,
                      child: Text("A+",style: TextStyle(fontSize: 16),),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 150,
                      child: Text("Phone:",style: TextStyle(fontSize: 16),),
                    ),
                    SizedBox(width: 50,),
                    Container(
                      alignment: Alignment.center,
                      child: Text("82XXXXXXX0",style: TextStyle(fontSize: 16),),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 150,
                      child: Text("Aadhar Number:",style: TextStyle(fontSize: 16),),
                    ),
                    SizedBox(width: 30,),
                    Container(
                      alignment: Alignment.center,
                      child: Text("9999888877776666",style: TextStyle(fontSize: 16),),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Text("Gender:",style: TextStyle(fontSize: 16),),
                    ),
                    SizedBox(width: 50,),
                    Container(
                      width: 50,
                      alignment: Alignment.centerLeft,
                      child: Text("Male",style: TextStyle(fontSize: 16),),
                    )
                  ],
                ), Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      color: Colors.blue,
                      child: Text("Address:",style: TextStyle(fontSize: 16),),
                    ),
                    SizedBox(width: 50,),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Akshaya Metro",style: TextStyle(fontSize: 16),),
                    )
                  ],
                ),

                // Text("Phone Number: 8299026397",style: TextStyle(fontSize: 16),),
                //   Text("Blood Group: A+",style: TextStyle(fontSize: 16),),
                //   Text("Aadharr Number: 9999-8888-7777-6666",style: TextStyle(fontSize: 16),),
                // Text("Address: Akshaya",style: TextStyle(fontSize:16),),
                // Text("ABHA No. : 12446V9284",style: TextStyle(fontSize:16),),
              ],
            ),
          ),


          SizedBox(height: 12),

        ],
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