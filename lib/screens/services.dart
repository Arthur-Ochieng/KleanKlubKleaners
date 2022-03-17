import 'package:flutter/material.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({ Key? key }) : super(key: key);

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  //var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Services"),
      ),

    );

  }
}
