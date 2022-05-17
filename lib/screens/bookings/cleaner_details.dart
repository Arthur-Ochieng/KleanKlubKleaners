import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kkservices/screens/bookings/draft.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kkservices/screens/fragments/cleaners.dart';



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
                              width: 150,
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
                              width: 150,
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
                              width: 150,
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
                            Text("ABOUT",
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

      // appBar: AppBar(
      //   title: const Text("cleanerData's Details"),
      // ),
      // body: Column(
      //   children: <Widget>[
      //     ListTile(
      //       title: Text(
      //           cleanerDataData['firstName']! + ' ' + cleanerDataData['secondName']),
      //       subtitle: Text(cleanerDataData['email']!),
      //       trailing: ElevatedButton(
      //         onPressed: () {
      //           FirebaseFirestore.instance
      //               .collection("booking")
      //               .add(data)
      //               .then((value) {
      //             data['documentID'] = value.id;
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) =>
      //                         BookingSummary(data: data)));
      //           });
      //         },
      //         child: const Text("Confirm Booking"),
      //       ),
      //     ),
      // ]),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height / 3 + 20,
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: <Widget>[
//                     Image.asset(
//                       "assets/icons/clean.jpg",
//                       fit: BoxFit.fill,
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height,
//                       color: Colors.blueAccent.withOpacity(0.1),
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 top: 50,
//                 left: 20,
//                 child: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: const Icon(
//                     Icons.arrow_back_ios,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: MediaQuery.of(context).size.height / 3 - 30,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height,
//                   decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(50),
//                       )),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         const SizedBox(
//                           height: 80,
//                         ),
//                         const Text(
//                           "Service List",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(20),
//                           child: Container(
//                             padding: const EdgeInsets.all(20),
//                             width: MediaQuery.of(context).size.width,
//                             height: MediaQuery.of(context).size.height / 8,
//                             color: const Color(0xff4E295B),
//                             child: Column(
//                               children: <Widget>[
//                                 Row(
//                                   children: const <Widget>[
//                                     Text(
//                                       "Angel Howard",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Text(
//                                       'Mar 9 2022',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w300,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 30,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xffFF8573),
//                                       size: 16,
//                                     ),
//                                     SizedBox(
//                                       width: 2,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xffFF8573),
//                                       size: 16,
//                                     ),
//                                     SizedBox(
//                                       width: 2,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xffFF8573),
//                                       size: 16,
//                                     ),
//                                     SizedBox(
//                                       width: 2,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xffFF8573),
//                                       size: 16,
//                                     ),
//                                     SizedBox(
//                                       width: 2,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xffFF8573),
//                                       size: 16,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: MediaQuery.of(context).size.height / 3 - 120,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: <Widget>[
//                       Container(
//                         width: MediaQuery.of(context).size.width / 3 - 20,
//                         height: MediaQuery.of(context).size.height / 6 + 35,
//                         decoration: BoxDecoration(
//                           color: cleanerData['bgColor'],
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Stack(
//                           fit: StackFit.expand,
//                           children: <Widget>[
//                             Positioned(
//                               top: 10,
//                               right: -25,
//                               child: Image.asset(
//                                 cleanerData['imgUrl'],
//                                 scale: 1.7,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                       Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               cleanerData['firstName'],
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             Text(
//                               cleanerData['company'],
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w300,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               children: <Widget>[
//                                 const Icon(
//                                   Icons.star,
//                                   size: 16,
//                                   color: Color(0xffFF8573),
//                                 ),
//                                 const SizedBox(
//                                   width: 5,
//                                 ),
//                                 Text(
//                                   cleanerData['rating'],
//                                   style: const TextStyle(
//                                     color: Color(0xffFF8573),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 5,
//                                 ),
//                                 Text(
//                                   '(${cleanerData['rateAmount']})',
//                                   style: const TextStyle(
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ]),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 right: 10,
//                 top: MediaQuery.of(context).size.height / 3 - 55,
//                 child: MaterialButton(
//                   onPressed: () {},
//                   padding: const EdgeInsets.all(10),
//                   shape: const CircleBorder(),
//                   color: Colors.white,
//                   child: const Icon(Icons.favorite_border),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
