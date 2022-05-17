import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kkservices/screens/bookings/cleaner_details.dart';
import 'package:kkservices/screens/payment/payment_UI.dart';

class OrderSummary extends StatefulWidget {
  final Map<String, dynamic> orderData;
  const OrderSummary({Key? key, required this.orderData}) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  String? userID = "";
  late String? test;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  Map<String, dynamic> data = {};
  @override
  void initState() {
    super.initState();
    data = widget.orderData;
    userID = currentUser?.uid;
    test = currentUser?.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      color: Colors.black,
                      size: 26,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text("Booking Details",
                      style: GoogleFonts.nunitoSans(
                        color: Colors.black,
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
                        height: 70,
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
                              width: 150,
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
                              width: 150,
                            ),
                            Text(data['cleaner'],
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "DETAILS",
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
                              width: 150,
                            ),
                            Text(data['date'].toString(),
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 15.0),
                      //   child: Row(
                      //     children: [
                      //       Text("PHONE ",
                      //           style: GoogleFonts.nunitoSans(fontSize: 15)),
                      //       const SizedBox(
                      //         width: 150,
                      //       ),
                      //       Text(data['phoneNumber'].toString(),
                      //           style: GoogleFonts.nunitoSans(fontSize: 15)),
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            Text("TIME",
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                            const SizedBox(
                              width: 150,
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
                        height: 30,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection("booking")
                              .add(data)
                              .then((value) {
                            data['documentID'] = value.id;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentModule()));
                          });
                        },
                        child: const Text("Mark as Completed"),
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
