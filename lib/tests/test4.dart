import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kkservices/screens/fragments/details.dart';
import 'package:kkservices/screens/fragments/marker.dart';
import 'package:kkservices/tests/test6.dart';

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
            Map<String, dynamic> cleaner_data =
                document.data()! as Map<String, dynamic>;

            return ListTile(
              title: Text(cleaner_data['firstName']! +
                  ' ' +
                  cleaner_data['secondName']),
              subtitle: Text(cleaner_data['email']!),
              trailing: ElevatedButton(
                onPressed: () {
                  data['cleaner'] = cleaner_data;
                  //print(cleaner_data);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DisplayDetails(
                              data: data, cleaner_data: cleaner_data)));
                },
                child: const Text("View Profile"),
              ),
            );
          }).toList(),
        );
      },
    ));
  }
}

// class AddData extends StatelessWidget {
//   AddData({Key? key}) : super(key: key);

//   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
//       .collection('users')
//       .where('type', isEqualTo: "cleaner")
//       //.doc(uid)
//       .snapshots();

//   // Map<String, dynamic> data = {};
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   data = widget.data;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<QuerySnapshot>(
//       stream: _usersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return const Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Text("Loading");
//         }
//         return ListView(
//           children: snapshot.data!.docs.map((DocumentSnapshot document) {
//             Map<String, dynamic> cleaner_data =
//                 document.data()! as Map<String, dynamic>;

//             return ListTile(
//               title: Text(cleaner_data['firstName']! + ' ' + cleaner_data['secondName']),
//               subtitle: Text(cleaner_data['email']!),
//               trailing: ElevatedButton(
//                 onPressed: () {
//                   print(cleaner_data);
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => DisplayDetails()));
//                 },
//                 child: const Text("View Profile"),
//               ),
//             );
//           }).toList(),
//         );
//       },
//     )
//     );
//   }
// }
