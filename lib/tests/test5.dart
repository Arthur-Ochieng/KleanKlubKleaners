import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReadDataPage extends StatelessWidget {
  ReadDataPage({Key? key}) : super(key: key);

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
          .collection('users')
          .where('type', isEqualTo: "cleaner")
          .snapshots()
      // .where(type = cleaner)
      ;
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

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
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            //print(data['firstName']);
            return ListTile(
              title: Text(data['firstName']! + ' ' + data['secondName']),
              subtitle: Text(data['email']!),
              trailing: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>()));
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
