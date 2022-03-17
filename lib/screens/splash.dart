import 'package:flutter/material.dart';
import 'package:kkservices/screens/started.dart';

class Splash extends StatefulWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

 _navigatetohome()async{
   await Future.delayed(const Duration(milliseconds: 3000), (){});
   Navigator.pushReplacement(
     context, MaterialPageRoute(builder: (context) => const GetStarted()));
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 150,
              width: 100,
              child: Image.asset('assets/icons/KK.png'),
              //color: Colors.blueAccent,
            ),
            Container(
              child: const Text(
                'Klean Klub Services',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}