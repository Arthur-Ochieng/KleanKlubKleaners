import 'package:flutter/material.dart';
import 'package:kkservices/screens/notifications.dart';
import 'package:kkservices/screens/profile.dart';
import 'package:kkservices/screens/services.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [
    const MainPage(),
    const ServicesPage(),
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
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blueAccent,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Services',
            backgroundColor: Colors.blueAccent,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Notification',
            backgroundColor: Colors.blueAccent,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blueAccent,
          )
        ],
      ),
    );
  }
}
