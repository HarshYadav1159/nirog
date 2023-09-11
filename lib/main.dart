import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projects/screen_routes.dart';
import 'package:projects/screens/diagnostics_screen.dart';
import 'package:projects/screens/home_screen.dart';
import 'package:projects/screens/registration_screens/login_screen.dart';
import 'package:projects/screens/medication.dart';
import 'package:projects/screens/tests_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nirog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      initialRoute: homeScreen,
      routes: {
          loginScreen : (context) => const LoginScreen(),
          homeScreen : (context) => const MyHomePage(),
          diagnosticScreen : (context) => const Diagnostics(),
          testScreen : (context) => const Tests(),
          medicationScreen : (context) => const Medications(),
      },
    );
  }
}



