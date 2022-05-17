// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class BookingSummary extends StatefulWidget {
//   final Map<String, dynamic> data;
//   const BookingSummary({
//     Key? key, 
//     required this.data}) : super(key: key);

//   @override
//   State<BookingSummary> createState() => _BookingSummaryState();
// }

// class _BookingSummaryState extends State<BookingSummary> {
//   String? userID = "";
//   late String? test;
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   User? get currentUser => _firebaseAuth.currentUser;

//   Map<String, dynamic> data = {};
//   @override
//   void initState() {
//     super.initState();
//     data = widget.data;
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Booking Summary"),
//       ),
//       body: Column(children: <Widget>[
//         ListTile(
//           title: Text(
//               data['service']! + ' ' + data['cleaner']),
//           subtitle: Text(data['date']!),
//           trailing: ElevatedButton(
//             onPressed: () {},
//             child: const Text("Proceed to Checkout"),
//           ),
//         ),
//       ]),
//     );
//   }
// }


