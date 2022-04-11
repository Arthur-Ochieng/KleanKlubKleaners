import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddData extends StatelessWidget {
  AddData({Key? key}) : super(key: key);

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance
        .collection('users').where('type', isEqualTo: "cleaner").snapshots()
        //.where(type = cleaner)
        ;

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
                title: Text(data['firstName']!),
                subtitle: Text(data['email']!),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
