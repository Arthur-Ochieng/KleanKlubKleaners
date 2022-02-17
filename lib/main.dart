import 'package:flutter/material.dart';
import 'package:kkservices/screens/splash.dart';
import 'package:kkservices/screens/intro.dart';
import 'package:kkservices/screens/notifications.dart';
import 'package:kkservices/screens/profile.dart';
import 'package:kkservices/screens/test.dart';

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

class LandingPage extends StatefulWidget {
  const LandingPage({ Key? key }) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentIndex = 0;
  final screens = [
    const MainPage(),
    const Testing(),
    const NotificationsPage(),
    const Profile(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        currentIndex: currentIndex,
        onTap: (Index) => setState(() => currentIndex = Index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Services',
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Notification',
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blueAccent,
          )
        ],
      ),
    );
  }
}





 