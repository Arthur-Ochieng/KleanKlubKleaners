import 'package:flutter/material.dart';
import 'package:kkservices/screens/login_screen.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({ Key? key }) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      // appBar: AppBar(
      //   title: const Text("Klean Klub"),
      // ),
      body: Center(
        child: Column(
          children:[
            SizedBox(height: 30,),
            Text("Clean Home\nClean Life", style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontFamily: 'ubuntu',
              fontWeight: FontWeight.w900,
            ),),
            SizedBox(height: 30,),
            Text("Book Cleans At The Comfort \nof Your Home", style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),),
            SizedBox(height: 60,),
            Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/KK.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}