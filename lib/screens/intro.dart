import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:kkservices/models/services.dart';
import 'package:kkservices/models/services.dart';
import 'package:kkservices/screens/login_screen.dart';
import 'package:kkservices/screens/notifications.dart';
import 'package:kkservices/screens/profile.dart';
import 'package:kkservices/screens/services.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = TextEditingController();
  List<Service> Services = allServices;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin:  const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: TextField(
              controller: controller,
              decoration:  InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search for a service',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black),

                ),
              ),
            ),
            
          ),
        ],
        // ignore: prefer_const_literals_to_create_immutables
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('UserName'),
            ),
            ListTile(
              title: const Text('Notifications'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Wallet'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const ServicesPage()));
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginScreen()
                  )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}