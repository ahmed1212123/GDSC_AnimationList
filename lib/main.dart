import 'package:flutter/material.dart';
import 'package:gdsc_login/animation_map.dart';
import 'package:gdsc_login/login_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black26,
        primarySwatch: Colors.purple,
      ),
      home: AnimationMap(),
    );
  }
}

