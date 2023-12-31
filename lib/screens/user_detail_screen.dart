import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projects/providers/user_details_provider.dart';
import 'package:provider/provider.dart';

import '../screen_routes.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  static String p = "";
  static String userName = "";

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff13bcfb),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/images/profile.png'),
              height: 108,
              width: 108,
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              padding: EdgeInsets.all(5),
              height: 55,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                onChanged: (value) {
                  _name.text = value;
                },
                decoration:
                    InputDecoration(border: InputBorder.none, hintText: 'Name'),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.all(5),
              height: 55,
              margin: EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                onChanged: (value) {
                  _phone.text = value;
                  UserDetails.p = _phone.text;
                },
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Phone Number'),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.all(5),
              height: 55,
              margin: EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                onChanged: (value) {
                  _age.text = value;
                },
                keyboardType: TextInputType.phone,
                decoration:
                    InputDecoration(border: InputBorder.none, hintText: 'Age'),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () async {
                context.read<UserDetailsProvider>().createUSer(
                    name: _name.text,
                    phone: int.parse(_phone.text),
                    age: int.parse(_age.text));
                Navigator.pushNamed(context, profileScreen);
              },
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.lightBlue),
            )
          ],
        ),
      ),
    );
  }
}
