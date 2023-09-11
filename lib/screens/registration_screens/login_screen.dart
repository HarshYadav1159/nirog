import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projects/screen_routes.dart';

import '../../widgets/navigation_drawer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
   static String verify="";
   static String p="";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController countryCode = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    // Initially display +91 in the text field
    countryCode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              child: Icon(Icons.phone_android_outlined),
            ),
            Text(
              'Phone Verification',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Register your phone',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 40,

                    //Display Country Code-----------
                    child: TextField(
                      controller: countryCode,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),

                  Text(
                    "|",
                    style: TextStyle(fontSize: 33, color: Colors.grey),
                  ),

                  //Enter Mobile Number-------------
                  Expanded(
                      child: TextField(

                        onChanged: (value){
                          LoginScreen.p = value;
                          phoneController.text=value;
                        },
                        keyboardType: TextInputType.phone,
                    decoration: InputDecoration(border: InputBorder.none, hintText: 'Phone Number'),
                  ))
                ],
              ),
            ),
            ElevatedButton (
              onPressed: ()async {
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: '${countryCode.text+phoneController.text}',
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verificationId, int? resendToken) {
                    LoginScreen.verify=verificationId;
                    Navigator.pushNamed(context, otpScreen);
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );
                },
              child: Text(
                'Get OTP',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.lightBlue),
            )
          ]),
        ),
      ),
    );
  }
}
