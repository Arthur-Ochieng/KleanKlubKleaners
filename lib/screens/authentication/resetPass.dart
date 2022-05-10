import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kkservices/screens/authentication/login_screen.dart';

class ResetPassPage extends StatefulWidget {
  const ResetPassPage({Key? key}) : super(key: key);

  @override
  State<ResetPassPage> createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ResetPassPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future resetPassword() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      Fluttertoast.showToast(msg: "Password Reset Email has been sent");
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      //print(e);

      Fluttertoast.showToast(msg: e.toString());
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.blueAccent,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(36),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 145,
                  child: Image.asset(
                    "assets/icons/KK.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 35),
                const Text(
                  "Enter email to reset your password",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.5),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.mail),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Email",
                    border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? "Enter a valid Email"
                          : null,
                ),
                const SizedBox(height: 20),

                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blueAccent,
                  child: MaterialButton(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: resetPassword,
                    child: const Text(
                      "Reset",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 19, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),


                // ElevatedButton.icon(
                  
                //     style: ElevatedButton.styleFrom(
                //       minimumSize: const Size.fromHeight(50),
                //     ),
                //     icon: const Icon(Icons.email_outlined),
                //     onPressed: resetPassword,
                //     label: const Text(
                //       "Reset Password",
                //       style: TextStyle(fontSize: 24),
                //     )),
              ],
            )),
      ),
    );
  }
}
