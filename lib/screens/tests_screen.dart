import 'package:flutter/material.dart';
import 'package:projects/models/test_model.dart';
import 'package:projects/providers/tests_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/navigation_drawer.dart';
import 'image_display_screen.dart';

class Tests extends StatefulWidget {
  const Tests({super.key});

  @override
  State<Tests> createState() => _TestsState();
}

class _TestsState extends State<Tests> {

  @override
  Widget build(BuildContext context) {

      return Scaffold(

        appBar: AppBar(
          title: const Text(
            'Tests',
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
        body: StreamBuilder<List<TestModel>>(
            stream: context.read<TestProvider>().readTests(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text("Some Error Occured"));
              } else if (snapshot.hasData) {
                final tests = snapshot.data!;

                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    children: tests.map(testsCard).toList(),
                  ),
                );
              } else if (!snapshot.hasData) {
                return Center(
                  child: Text("No Record Found"),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
        drawer: const CustomNavigationDrawer(),
       // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
       //  floatingActionButton: FloatingActionButton(
       //    onPressed: () {
       //      //openDialog(context);
       //    },
       //    backgroundColor: Colors.lightBlue,
       //    child: const Icon(
       //      Icons.add,
       //      color: Colors.white,
       //    ),
       //  ),
      );
  }

  Widget testsCard(TestModel testModel) =>
      Padding(
        padding: EdgeInsets.all(10.0),
        child: InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ImageScreen(imageUrl: testModel.fileUrl,name: testModel.name,)),
            );
          },
          child: Container(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 1.5,
                  // color: Colors.grey,
                  decoration: BoxDecoration(
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
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "${testModel.labName}",
                                style: TextStyle(),
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding:  EdgeInsets.only(left: 12.0,bottom: 20.0),
                          child: Text(
                            testModel.name!,
                            style:
                            TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                        ),
                      ),
                      Center(child:Padding(
                        padding: EdgeInsets.only(top: .0),
                        child: Container(
                          height: MediaQuery.sizeOf(context).height/5,
                          width: MediaQuery.sizeOf(context).width/1.6,
                          // color: Colors.blue,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            image: DecorationImage(
                              image: NetworkImage(testModel.fileUrl!),
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
        ),
      );
}
