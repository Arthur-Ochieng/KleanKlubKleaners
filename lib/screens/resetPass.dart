import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kkservices/screens/login_screen.dart';


class ResetPassPage extends StatefulWidget {
  const ResetPassPage({ Key? key }) : super(key: key);

  @override
  State<ResetPassPage> createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ResetPassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 200),
            const Text(
              "Reset Password",
              style: TextStyle(
                color: Color(0xFF1B383A),
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Please Enter Your Email Address",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Color(0xFF979797)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF1B383A))
                )
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const LoginScreen())));
              },
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.08,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xFF1B383A),
                ),
                child: const Text(
                  "Reset Password",
                  style: TextStyle(color: Color(0x0fffffff)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ResetPasswordPage extends StatelessWidget {
//   const ResetPasswordPage({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
 
//     );
//   }
// }