import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kkservices/screens/bookings/test6.dart';

class ConfirmTruce extends StatefulWidget {
  final Map<String, dynamic> data;
  const ConfirmTruce({Key? key, required this.data}) : super(key: key);

  @override
  State<ConfirmTruce> createState() => _ConfirmTruceState();
}

class _ConfirmTruceState extends State<ConfirmTruce> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .where('type', isEqualTo: "cleaner")
      //.doc(uid)
      .snapshots();

  Map<String, dynamic> data = {};
  @override
  void initState() {
    super.initState();
    data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Cleaners"),
      ),
      body: StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> cleanerData =
                document.data()! as Map<String, dynamic>;

            return ListTile(
              title: Text(cleanerData['firstName']! +
                  ' ' +
                  cleanerData['secondName']),
              subtitle: Text(cleanerData['email']!),
              trailing: ElevatedButton(
                onPressed: () {
                  data['cleaner'] = cleanerData['firstName'];
                  data['cleaner_uid'] = cleanerData['uid'];
                  //print(cleaner_data);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DisplayDetails(
                              data: data, cleanerData: cleanerData)));
                },
                child: const Text("View Profile"),
              ),
            );
          }).toList(),
        );
      },
    )
    );
  }
}

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
//                               Map<String, dynamic> cleaner_data =
//                                   document.data()! as Map<String, dynamic>;

//                               return ListTile(
//                                 title: Text(cleaner_data['firstName']! +
//                                     ' ' +
//                                     cleaner_data['secondName']),
//                                 subtitle: Text(cleaner_data['email']!),
//                                 trailing: ElevatedButton(
//                                   onPressed: () {
//                                     data['cleaner'] = cleaner_data['firstName' + 'secondName'];
//                                     data['cleaner_uid'] = cleaner_data['uid'];
//                                     //print(cleaner_data);
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) => DisplayDetails(
//                                                 data: data, cleaner_data: cleaner_data)));
//                                   },
//                                   child: const Text("View Profile"),
//                                 ),
//                               );
//                             }).toList(),
//                           );
//                         },
//                       )
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

// // class AddData extends StatelessWidget {
// //   AddData({Key? key}) : super(key: key);

// //   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
// //       .collection('users')
// //       .where('type', isEqualTo: "cleaner")
// //       //.doc(uid)
// //       .snapshots();

// //   // Map<String, dynamic> data = {};
// //   // @override
// //   // void initState() {
// //   //   super.initState();
// //   //   data = widget.data;
// //   // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: StreamBuilder<QuerySnapshot>(
// //       stream: _usersStream,
// //       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// //         if (snapshot.hasError) {
// //           return const Text('Something went wrong');
// //         }

// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return const Text("Loading");
// //         }
// //         return ListView(
// //           children: snapshot.data!.docs.map((DocumentSnapshot document) {
// //             Map<String, dynamic> cleaner_data =
// //                 document.data()! as Map<String, dynamic>;

// //             return ListTile(
// //               title: Text(cleaner_data['firstName']! + ' ' + cleaner_data['secondName']),
// //               subtitle: Text(cleaner_data['email']!),
// //               trailing: ElevatedButton(
// //                 onPressed: () {
// //                   print(cleaner_data);
// //                   Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                           builder: (context) => DisplayDetails()));
// //                 },
// //                 child: const Text("View Profile"),
// //               ),
// //             );
// //           }).toList(),
// //         );
// //       },
// //     )
// //     );
// //   }
// // }
