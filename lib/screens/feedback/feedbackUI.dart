import 'package:animated_textformfields/animated_textformfield/animated_textformfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kkservices/screens/home_page.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  FocusNode myFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey();
  double rating = 0;

  final feedbackEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45.0, left: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "Give Feedback",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 26, color: Colors.black),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "How did we do?",
                  style:
                      GoogleFonts.nunitoSans(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => showRating(),
              child: const Text(
                "Rate the cleaner and the cleaning services",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                "Rating: $rating",
                style: const TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(height: 10),
            buildRating(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "share info about it?",
                  style:
                      GoogleFonts.nunitoSans(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AnimatedTextFormField(
              controller: feedbackEditingController,
              width: MediaQuery.of(context).size.width,
              maxLines: 90,
              height: 200,
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
              focusNode: myFocusNode,
              validator: (val) {
                if (val.isEmpty) {
                  return "please enter feedback";
                }
                return null;
              },
              cornerRadius: BorderRadius.circular(10.0),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70),
              child: AnimatedButton(
                  height: 50,
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  transitionType: TransitionType.LEFT_TO_RIGHT,
                  backgroundColor: Colors.blueAccent,
                  borderColor: Colors.white,
                  borderRadius: 10,
                  borderWidth: 2,
                  text: "Send Feedback",
                  onPress: () {
                    showDialog(
                        context: context,
                        builder: (context) => const FeedBackDialog());
                  }),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Text(
                "HOME",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showRating() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Rate the cleaning experience"),
        content: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Please leave a star rating",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            buildRating(),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRating() => RatingBar.builder(
        initialRating: rating,
        itemBuilder: (context, _) =>
            const Icon(Icons.star, color: Colors.amber),
        updateOnDrag: true,
        onRatingUpdate: (rating) => setState(() {
          this.rating = rating;
        }),
        minRating: 1,
        itemSize: 35,
        // itemPadding: const EdgeInsets.symmetric(horizontal: 4),
      );
}

class FeedBackDialog extends StatefulWidget {
  const FeedBackDialog({Key? key}) : super(key: key);

  @override
  State<FeedBackDialog> createState() => _FeedBackDialogState();
}

class _FeedBackDialogState extends State<FeedBackDialog> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
          key: _formKey,
          child: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: 'Enter your feedback here',
              filled: true,
            ),
            maxLines: 5,
            maxLength: 4096,
            textInputAction: TextInputAction.done,
            validator: (String? text) {
              if (text == null || text.isEmpty) {
                return 'Please enter a value';
              }
              return null;
            },
          )),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel')),
        TextButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                String message;

                try {
                  final collection =
                      FirebaseFirestore.instance.collection('feedback');
                  await collection.doc().set({
                    'timestamp': FieldValue.serverTimestamp(),
                    'feedback': _controller.text,
                  });
                  message = "Feedback sent successfully";
                } catch (_) {
                  message = 'Error when sending feedback';
                }
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
                Navigator.pop(context);
              }
            },
            child: const Text('Send')),
      ],
    );
  }
}
