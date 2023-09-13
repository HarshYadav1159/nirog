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
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
        backgroundColor:Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount:10,
            itemBuilder: (BuildContext context, int index) {
              return
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.2,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 4,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(blurRadius: 10.0),
                      ],),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Dummy D3 Capsule', style: TextStyle(fontWeight: FontWeight
                              .bold, fontSize: 23),),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            '13/9/2023', style: TextStyle( fontSize: 15),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'After Lunch', style:  TextStyle(fontWeight: FontWeight
                                        .bold,fontSize: 15),),
                                    Text(
                                      'After Dinner', style: TextStyle(fontWeight: FontWeight
                                        .bold,fontSize: 15),),
                                  ],
                                ),
                              ),
                            ],),
                            Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  // height: MediaQuery
                                  //     .of(context)
                                  //     .size
                                  //     .height / 4.5,
                                  height: 90,
                                  width:90,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/medicine.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
            }

        ),
      ),
      drawer: const CustomNavigationDrawer(),
    );
  }
}
