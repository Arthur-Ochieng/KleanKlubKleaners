import 'package:flutter/material.dart';
import 'package:kkservices/screens/feedback/feedbackUI.dart';

class Success extends StatefulWidget {
  const Success({ Key? key }) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                 Image(
                  image: AssetImage("assets/icons/KK.png"),
                  height: 150,
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Successful',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF303030),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Text(
              "Your Payment was Successful",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueAccent,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(vertical: 24),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: FlatButton(
              padding: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.blueAccent,
              textColor: Colors.white,
              highlightColor: Colors.transparent,
              onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FeedbackScreen(),
                  ));
              },
              child: Text("OK".toUpperCase()),
            )
          ),
        ],
      ),
    );
  }
}