import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:projects/screen_routes.dart';
import 'package:projects/screens/registration_screens/login_screen.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});
  static String _id="";
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController countryCode = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final pinController = TextEditingController();
  String _uid="";
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  void initState() {
    // Initially display +91 in the text field
    countryCode.text = "+91";
    super.initState();
  }

Future<bool> checkUser()async{
    DocumentSnapshot snapshot = await _firebaseFirestore.collection("users").doc(LoginScreen.p).get();
    if(snapshot.exists){
      return true;
    }
    else{
      return false;
    }
}

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    var code="";
    return Scaffold(
      body: Container(
        //margin: EdgeInsets.only(left: 25, right: 25),
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
              'Enter OTP',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Directionality(
                      // Specify direction if desired
                      textDirection: TextDirection.ltr,
                      child: Pinput(
                        length: 6,

                        controller: pinController,
                        focusNode: focusNode,
                        androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,

                        listenForMultipleSmsOnAndroid: true,
                        defaultPinTheme: defaultPinTheme,
                        separatorBuilder: (index) => const SizedBox(width: 3),


                        hapticFeedbackType: HapticFeedbackType.lightImpact,

                        onChanged: (value) {
                          code = value;
                        },
                        cursor: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 9),
                              width: 22,
                              height: 1,
                              color: focusedBorderColor,
                            ),
                          ],
                        ),
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        submittedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            color: fillColor,
                            borderRadius: BorderRadius.circular(19),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        errorPinTheme: defaultPinTheme.copyBorderWith(
                          border: Border.all(color: Colors.redAccent),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
                ],
              ),),

            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () async{
                try{
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: LoginScreen.verify, smsCode: code);

                  // Sign the user in (or link) with the credential
                  User user = (await auth.signInWithCredential(credential)).user!;
                  if(user != null){
                    _uid = user.uid;
                  }


                  if(await checkUser())
                    Navigator.pushNamed(context, firstPage);
                  else
                    Navigator.pushNamed(context, userDetails);

                }
                catch(e){

                }

              },
              child:Text(
                'Submit',
                style: TextStyle(color:Colors.white),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.lightBlue),
            )
          ]),
        ),
      ),
    );
  }
}
