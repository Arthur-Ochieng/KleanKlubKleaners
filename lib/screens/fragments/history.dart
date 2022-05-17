import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kkservices/screens/bookings/cleaner_details.dart';

class ConfirmTruce extends StatefulWidget {
  const ConfirmTruce({Key? key}) : super(key: key);

  @override
  State<ConfirmTruce> createState() => _ConfirmTruceState();
}

class _ConfirmTruceState extends State<ConfirmTruce> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('booking')
      .where('status', isEqualTo: "Completed")
      //.doc(uid)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("History"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                    onPressed: () {},
                    child: const Text("View Details"),
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}



