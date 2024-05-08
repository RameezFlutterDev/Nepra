import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nepraproj/auth/auth_gate.dart';
import 'package:nepraproj/firebase_options.dart';
import 'package:nepraproj/views/debt.dart';
import 'package:nepraproj/views/homepage.dart';
import 'package:nepraproj/views/hydro.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nepra',
      home: Hydro(),
    );
  }
}
