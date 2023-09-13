import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projects/models/diagnostics_model.dart';
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
  List<DiagnosticsModel> dModel = [
    DiagnosticsModel(
        diagnosisName: "Severe Headache",
        doctorName: "Dr. Anil Tripathi",
        imageUrl: "assets/images/img1.png"),
    DiagnosticsModel(
        diagnosisName: "Migraine",
        doctorName: "Dr. Ashok Jain",
        imageUrl: "assets/images/img1.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nirog',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF7CC4F8),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            color: Color(0xFF7CC4F8),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text("Jai Kumar",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 12,
                      ),
                      Text("4",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      Text("Reports",
                          style: TextStyle(
                              color: Color(0xFF8E8E8E),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text("13",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      Text("Medication",
                          style: TextStyle(
                              color: Color(0xFF8E8E8E),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2.5,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Image.asset('assets/images/profile.png'),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Recent",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dModel.length,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width / 1.5,
                              // color: Colors.grey,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(blurRadius: 0.5),
                                  ],
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, bottom: 8.0),
                                          child: Text(
                                            dModel[index].doctorName!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          //Column(
                                          //   mainAxisSize: MainAxisSize.min,
                                          //   crossAxisAlignment: CrossAxisAlignment.start,
                                          //   children: [
                                          //     Text(dModel[index].doctorName!,style: TextStyle(fontSize: 12),),
                                          //     Text(dModel[index].diagnosisName!,style: TextStyle(fontWeight: FontWeight.bold),)
                                          //   ],
                                          // ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0,bottom: 20.0),
                                    child: Text(
                                      dModel[index].diagnosisName!,
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                                    ),
                                  ),
                                  Center(child:Padding(
                                    padding: const EdgeInsets.only(top: .0),
                                    child: Container(
                                      height: MediaQuery.sizeOf(context).height/6,
                                      width: MediaQuery.sizeOf(context).width/1.6,
                                     // color: Colors.blue,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(22)),
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/img1.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          )
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
