import 'package:flutter/material.dart';
import 'package:flutter_machine_test/patient_details_screen/patient_details_screen.dart';
import 'package:flutter_machine_test/prescription_screen/prescription_screen.dart';
import 'package:flutter_machine_test/register_screen/register_screen.dart';
import 'package:flutter_machine_test/splash_screen/splash_screen.dart';
import 'package:flutter_machine_test/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PatientDetailsScreen(),
    );
  }
}
