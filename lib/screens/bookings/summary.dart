import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kkservices/screens/bookings/complete.dart';

class BookingSummary extends StatefulWidget {
  final Map<String, dynamic> data;
  const BookingSummary({Key? key, required this.data}) : super(key: key);
  @override
  _BookingSummaryState createState() => _BookingSummaryState();
}

class _BookingSummaryState extends State<BookingSummary> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  Map<String, dynamic> data = {};
  @override
  void initState() {
    super.initState();
    data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: ListView.builder(
          //itemCount: data.length,
          itemBuilder: (_, index) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text("Booking Summary",
                      style: GoogleFonts.nunitoSans(
                        color: Colors.white,
                        fontSize: 26,
                      ))
                ]),
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                width: 350,
                height: 600,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "KK Services",
                        style: GoogleFonts.nunitoSans(fontSize: 23),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "SERVICE DETAILS",
                            style: GoogleFonts.nunitoSans(
                                fontSize: 18, color: Colors.green),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            Text("SERVICE",
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                            const SizedBox(
                              width: 170,
                            ),
                            Text(data['service']!,
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            Text("CLEANER",
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                            const SizedBox(
                              width: 170,
                            ),
                            Text(data['cleaner'],
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "BOOKING DETAILS",
                            style: GoogleFonts.nunitoSans(
                                fontSize: 18, color: Colors.green),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            Text("DATE",
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                            const SizedBox(
                              width: 170,
                            ),
                            Text(data['date'].toString(),
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            Text("TIME",
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                            const SizedBox(
                              width: 170,
                            ),
                            Text(data['time'].toString(),
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            Text("AMOUNT",
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                            const SizedBox(
                              width: 145,
                            ),
                            Text(data['amount'].toString(),
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            Text("FREQUENCY",
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                            const SizedBox(
                              width: 126,
                            ),
                            Text(data['frequency']!,
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            Text("INSTRUCTIONS",
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                            const SizedBox(
                              width: 80,
                            ),
                            Text(data['instructions']!,
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            Text("STATUS",
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                            const SizedBox(
                              width: 150,
                            ),
                            Text(data['status']!,
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BookingStatus()));
                        },
                        child: const Text("Confirm"),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
