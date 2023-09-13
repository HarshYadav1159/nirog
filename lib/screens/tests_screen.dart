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
          itemCount:3,
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
                      .height / 2,
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
                          'Brain MRI', style: TextStyle(fontWeight: FontWeight
                            .bold, fontSize: 23),),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          '13/9/2023', style: TextStyle( fontSize: 15),),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 200,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(
                                image: AssetImage("assets/images/img1.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
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
