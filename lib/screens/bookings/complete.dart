
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kkservices/screens/home_page.dart';

class BookingStatus extends StatelessWidget {
  const BookingStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 250,
          ),
          const Center(
            child: Icon(
              Icons.celebration_outlined,
              size: 90,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(
            height: 30
          ),
          Text(
            "Thank You For Your Booking!",
            style: GoogleFonts.nunitoSans(fontSize: 28),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Your Booking Was Completed Successfully.",
            style: GoogleFonts.nunitoSans(fontSize: 18),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 90, right: 100),
              child: AnimatedButton(
                  height: 50,
                  width: 200,
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  transitionType: TransitionType.LEFT_TO_RIGHT,
                  backgroundColor: Colors.blueAccent,
                  borderColor: Colors.white,
                  borderRadius: 30,
                  borderWidth: 2,
                  text: "Continue",
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  })),
        ],
      ),
    );
  }
}
