import 'package:flutter/material.dart';
import 'package:kkservices/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kkservices/screens/started.dart';

class Splash extends StatefulWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initstate (){
    super.initState();
    _navigateToLogin(); //navigating to the login screen
  }

  _navigateToLogin() async{
    //navigate to the login screen in 5000ms or 5 seconds
    await Future.delayed (const Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const myHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffefeee9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/KK.png"),
            Text(
              "Klean Klub Services",
              style: GoogleFonts.salsa(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.blueAccent,
                )
              ),
          ],
        ),
      ),
      
    );
  }
}