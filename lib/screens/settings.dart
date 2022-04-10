import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget{
  const SettingsPage({Key? key}) : super(key: key);
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const SizedBox(height: 40),
            Row(
              children: const [
                Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Text("Account", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
      ),
    );
  }
}