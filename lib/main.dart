import 'package:flutter/material.dart';
import 'package:kkservices/screens/login_screen.dart';
import 'package:kkservices/screens/splash.dart';
import 'package:kkservices/screens/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ubuntu',
      ),
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}




 