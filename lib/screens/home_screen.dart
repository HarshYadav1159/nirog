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
        backgroundColor:Color(0xff7cc4f8),
      ),
      body: Center(
        child: FutureBuilder(
            future: context.read<HomeScreenProvider>().readUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final user = snapshot.data;
                return user == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text("Hi ${user.name.toString()}");
              } else {
                return SizedBox();
              }
            }),
      body: Column(
        children: [
          // SizedBox(height: 12),
          Center(child:
          Container(

            decoration: BoxDecoration(
              // borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xff7cc4f8),

            ),
            alignment: Alignment.center,

            child: Column(
              children: [
                SizedBox(height: 12),
                Container(
                  height:MediaQuery.of(context).size.height/4.7,
                    width:MediaQuery.of(context).size.width,
                    child:Image.asset('assets/images/profile.png')),
                SizedBox(height: 12,),
                Text("Jai Kumar",style: TextStyle(fontSize:MediaQuery.of(context).size.height/35, fontWeight: FontWeight.bold),),

                Text("Contact: 82XXXXXXX0",style: TextStyle(fontSize: MediaQuery.of(context).size.height/35, fontWeight: FontWeight.bold),),
                // Text("Phone Number: ",style: TextStyle(fontSize: 16),),
              ],
            ),
            height: MediaQuery.of(context).size.height/2.75,
            width:MediaQuery.of(context).size.width,
          ),),
          SizedBox(
            height: MediaQuery.of(context).size.height/50,
          ),
          Container(
            // color: Colors.red,
            child: Column(

              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.height/50,
                    ),
                    Container(
                      // color: Colors.blue,
                      width: MediaQuery.of(context).size.width/2.3,
                      child: Text("Gender:",style: TextStyle(fontSize: MediaQuery.of(context).size.height/42, color: Colors.grey, fontWeight: FontWeight.bold),),
                    ),
                    // SizedBox(width: 50,),
                    Container(
                      alignment: Alignment.center,
                      child: Text("Male",style: TextStyle(fontSize: MediaQuery.of(context).size.height/42, fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width:  MediaQuery.of(context).size.height/50,
                    ),
                    Container(
                      // color: Colors.blue,
                      width: MediaQuery.of(context).size.width/2.3,
                      child: Text("Blood Group:",style: TextStyle(fontSize: MediaQuery.of(context).size.height/42, color: Colors.grey, fontWeight: FontWeight.bold),),
                    ),
                    // SizedBox(width: 50,),
                    Container(
                      alignment: Alignment.center,
                      child: Text("A+",style: TextStyle(fontSize: MediaQuery.of(context).size.height/42, fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width:  MediaQuery.of(context).size.height/50,
                    ),
                    Container(
                      // color: Colors.blue,
                      width: MediaQuery.of(context).size.width/2.3,
                      child: Text("Phone:",style: TextStyle(fontSize:MediaQuery.of(context).size.height/42, color: Colors.grey, fontWeight: FontWeight.bold),),
                    ),
                    // SizedBox(width: 50,),
                    Container(
                      alignment: Alignment.center,
                      child: Text("82XXXXXXX0",style: TextStyle(fontSize: MediaQuery.of(context).size.height/42, fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width:  MediaQuery.of(context).size.height/50,
                    ),
                    Container(
                      // color: Colors.blue,
                      width: MediaQuery.of(context).size.width/2.3,
                      child: Text("Aadhar Number:",style: TextStyle(fontSize: MediaQuery.of(context).size.height/42, color: Colors.grey, fontWeight: FontWeight.bold),),
                    ),
                    // SizedBox(width: 30,),
                    Container(
                      alignment: Alignment.center,
                      child: Text("999988887777",style: TextStyle(fontSize: MediaQuery.of(context).size.height/42, fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width:  MediaQuery.of(context).size.height/50,
                    ),
                    Container(
                      // color: Colors.blue,
                      width: MediaQuery.of(context).size.width/2.3,
                      child: Text("Gender:",style: TextStyle(fontSize: MediaQuery.of(context).size.height/42, color: Colors.grey, fontWeight: FontWeight.bold),),
                    ),

                    Container(

                      alignment: Alignment.centerLeft,
                      child: Text("Male",style: TextStyle(fontSize: MediaQuery.of(context).size.height/42, fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.height/50,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/2.3,
                      alignment: Alignment.topLeft,
                      // color: Colors.blue,
                      child: Text("Address:",style: TextStyle(fontSize: MediaQuery.of(context).size.height/42, color: Colors.grey, fontWeight: FontWeight.bold),),
                    ),

                    Container(
                      alignment: Alignment.topLeft,
                      height: MediaQuery.of(context).size.height/20,
                      child: AutoSizeText("Akshaya Metropolis",style: TextStyle(fontSize: MediaQuery.of(context).size.height/42, fontWeight: FontWeight.bold),maxLines: 2,),
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

// Future<UserModel> readUser() async {
//   String id = LoginScreen.p;
//   final docUser = FirebaseFirestore.instance.collection('users').doc(id);
//   final snapshot = await docUser.get();
//
//   if (snapshot.exists) {
//     return UserModel.fromJson(snapshot.data()!);
//   }
//   throw{
//   print("Error Fetching Data")
//   };
// }
}