import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kkservices/screens/bookings/summary.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayDetails extends StatefulWidget {
  final Map<String, dynamic> data;
  final Map<String, dynamic> cleanerData;
  const DisplayDetails(
      {Key? key, required this.data, required this.cleanerData})
      : super(key: key);

  @override
  State<DisplayDetails> createState() => _DisplayDetailsState();
}

class _DisplayDetailsState extends State<DisplayDetails> {
  Map<String, dynamic> data = {};
  Map<String, dynamic> cleanerDataData = {};
  @override
  void initState() {
    super.initState();
    data = widget.data;
    cleanerDataData = widget.cleanerData;
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
                  Text("Cleaner Details",
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
                            "CLEANER NAMES",
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
                            Text("FIRST NAME",
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                            const SizedBox(
                              width: 150,
                            ),
                            Text(cleanerDataData['firstName']!,
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
                            Text("SECOND NAME",
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                            const SizedBox(
                              width: 133,
                            ),
                            Text(cleanerDataData['secondName'],
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
                            Text("ADDRESS",
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                            const SizedBox(
                              width: 140,
                            ),
                            Text(cleanerDataData['address']!,
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
                            Text("PHONE ",
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                            const SizedBox(
                              width: 150,
                            ),
                            Text(cleanerDataData['phoneNumber'].toString(),
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
                            Text("EMAIL",
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                            const SizedBox(
                              width: 155,
                            ),
                            Text(cleanerDataData['email']!,
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
                            Text("RATINGS",
                                style: GoogleFonts.nunitoSans(fontSize: 15)),
                            const SizedBox(
                              width: 170,
                            ),
                            Text(cleanerDataData['ratings']!,
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
                            //data['documentID'] = value.id;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BookingSummary(data: data)));
                          });
                        },
                        child: const Text("Confirm Booking"),
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

