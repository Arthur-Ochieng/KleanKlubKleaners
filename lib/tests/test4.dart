// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:kkservices/models/booking.dart';

// class ReadDataPage extends StatefulWidget {
//   const ReadDataPage({Key? key}) : super(key: key);

//   @override
//   State<ReadDataPage> createState() => _ReadDataPageState();
// }

// class _ReadDataPageState extends State<ReadDataPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<List<User>>(
//         stream: readUsers(),
//         builder: (context,snapshot){
//           if (snapshot.hasData){
//             final Booking = snapshot.data!;
//           }
//           return ListView(
//             children: Booking.map(buildUser).toList[],
//           );
//         },
//       ),
//     );
//   }
// }

// Widget buildUser(User Booking) => ListTile(
//   leading: CircleAvatar(child: Tex,),
// );
//   Stream<List<User>> readUsers() => FirebaseFirestore.instance
//   .collection('users')
//   .map((snapshot) =>
//     snapshot.docs.map ((doc) => User.fromJson (doc.data())).toList());
// }

// // Future create