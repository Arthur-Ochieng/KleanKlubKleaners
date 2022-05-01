// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:kkservices/screens/fragments/details.dart';
// import 'package:kkservices/screens/fragments/marker.dart';


// class AddData extends StatelessWidget {
//   AddData({Key? key}) : super(key: key);

//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance
//         .collection('users').where('type', isEqualTo: "cleaner").snapshots()
//         //.where(type = cleaner)
//         ;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueAccent,
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.white,
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.search,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.vertical(
//                       top: Radius.circular(50),
//                     )),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       const SizedBox(
//                         height: 50,
//                       ),
//                       const Text(
//                         "Available Cleaners",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 24,
//                         ),
//                       ),
//                       StreamBuilder<QuerySnapshot>(
//                         stream: _usersStream,
//                         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                           if (snapshot.hasError) {
//                             return const Text('Something went wrong');
//                           }

//                           if (snapshot.connectionState == ConnectionState.waiting) {
//                             return const Text("Loading");
//                           }
//                           return ListView(
//                             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//                               Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//                               print(data['firstName']);
//                               return ListTile(
//                                 title: Text(data['firstName']! + ' ' + data['secondName']),
//                                 subtitle: Text(data['email']!),
//                                 trailing: ElevatedButton(
//                                   onPressed: () {                                  
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => const MarkerPage()));
//                                   },
//                                   child: const Text("View Profile"),
//                                 ),
//                               );
//                             }).toList(),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),     
//     );
//   }
// }
// class WorkerCard extends StatefulWidget {
//   WorkerCard({ Key? key }) : super(key: key);

 

//   @override
//   State<WorkerCard> createState() => _WorkerCardState();
// }

// class _WorkerCardState extends State<WorkerCard> {

//   final Stream<QuerySnapshot> _usersStream =
//   FirebaseFirestore.instance
//     .collection('users').where('type', isEqualTo: "cleaner").snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueAccent,
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.white,
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.search,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.vertical(
//                       top: Radius.circular(50),
//                     )),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       const SizedBox(
//                         height: 50,
//                       ),
//                       const Text(
//                         "Available Cleaners",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 24,
//                         ),
//                       ),
//                       StreamBuilder<QuerySnapshot>(
//                         stream: _usersStream,
//                         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                           if (snapshot.hasError) {
//                             return const Text('Something went wrong');
//                           }

//                           if (snapshot.connectionState == ConnectionState.waiting) {
//                             return const Text("Loading");
//                           }
//                           return ListView(
//                             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//                               Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//                               //print(data['firstName']);
//                               return ListTile(
//                                 title: Text(data['firstName']! + ' ' + data['secondName']),
//                                 subtitle: Text(data['email']!),
//                                 trailing: ElevatedButton(
//                                   onPressed: () {                                  
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => const MarkerPage()));
//                                   },
//                                   child: const Text("View Profile"),
//                                 ),
//                               );
//                             }).toList(),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),                    
//     );
//   }
// }


