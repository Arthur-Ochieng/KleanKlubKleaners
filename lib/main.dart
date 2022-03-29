import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kkservices/screens/fragments/maps.dart';
import 'package:kkservices/screens/fragments/page.dart';
import 'package:kkservices/screens/home_page.dart';
import 'package:kkservices/widgets/date_time_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'ubuntu',
      ),
      debugShowCheckedModeBanner: false,
      home: MarkerPage(),
    );
  }
}
