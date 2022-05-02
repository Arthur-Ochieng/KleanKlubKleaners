import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kkservices/screens/fragments/summary.dart';

var serviceList = [
  {'title': 'Cleaner Bio', 'duration': 45, 'price': 30},
  {'title': 'Phone Number', 'duration': 0712815240},
  {
    'title': 'Jobs Completed',
    'duration': 4,
  },
  {'title': 'Reviews and Rating', 'duration': 4, 'price': 67},
  //{'title': 'Laundry', 'duration': 45, 'price': 30},
];

class DisplayDetails extends StatefulWidget {
  final Map<String, dynamic> data;
  final Map<String, dynamic> cleaner_data;
  const DisplayDetails(
      {Key? key, required this.data, required this.cleaner_data})
      : super(key: key);

  @override
  State<DisplayDetails> createState() => _DisplayDetailsState();
}

class _DisplayDetailsState extends State<DisplayDetails> {
  Map<String, dynamic> data = {};
  Map<String, dynamic> cleaner_data = {};
  @override
  void initState() {
    super.initState();
    data = widget.data;
    cleaner_data = widget.cleaner_data;
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
//                         ServiceTile(serviceList[0]),
//                         ServiceTile(serviceList[1]),
//                         ServiceTile(serviceList[2]),
//                         ServiceTile(serviceList[3]),
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
//                           color: Color(0xffEBF6FF),
//                           //color: cleaner_data['bgColor'],
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Stack(
//                           fit: StackFit.expand,
//                           children: <Widget>[
//                             Positioned(
//                               top: 10,
//                               right: -25,
//                               child: Image.asset(
//                                 //cleaner_data['imgUrl'],
//                                 'assets/icons/KK.png',
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
//                           children: <Widget>[
//                             Text(
//                               cleaner_data['firstName' + 'secondName'],
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             Text(
//                               cleaner_data['phoneNumber'],
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
//                                   cleaner_data['address'],
//                                   style: const TextStyle(
//                                     color: Color(0xffFF8573),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 5,
//                                 ),
//                                 // Text(
//                                 //   '(${cleaner_data['rateAmount']})',
//                                 //   style: const TextStyle(
//                                 //     color: Colors.grey,
//                                 //   ),
//                                 // ),
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

// class ServiceTile extends StatelessWidget {
//   // const ServiceTile({Key? key}) : super(key: key);
//   final service;
//   ServiceTile(this.service);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 30),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(
//                 width: MediaQuery.of(context).size.width / 2 - 40,
//                 child: Text(
//                   service['title'],
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 '${service['duration']}',
//                 style: const TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//           Text(
//             '${service['price']}',
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//           ),
//           MaterialButton(
//             onPressed: () {
//               //print(data);
//             },
//             color: const Color(0xffFF8573),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: const Text(
//               'Book',
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cleaner's Details"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            //print(data);
            title:
                Text(cleaner_data['firstName']! + ' ' + cleaner_data['secondName']),
            subtitle: Text(cleaner_data['email']!),
            trailing: ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection("booking").add(data);
                //data['cleaner'] = cleaner_data;
                print(data);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BookingSummary()));
              },
              child: const Text("Confirm Booking"),
            ),
          ),
        ]
      ),
    );
  }
}
