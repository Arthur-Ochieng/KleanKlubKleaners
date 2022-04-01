import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestWrite extends StatefulWidget {
  const TestWrite({Key? key}) : super(key: key);

  @override
  State<TestWrite> createState() => _TestWriteState();
}

class _TestWriteState extends State<TestWrite> {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // FirebaseAuth auth = FirebaseAuth.instance;
  // User? user = FirebaseAuth.instance.currentUser;

  // CollectionReference tests = FirebaseFirestore.instance.collection('test');
  // Future<void> addBooking(var test) {
  //   //calls the collection to add a new booking
  //   return test
  //       .add(test)
  //       .then((value) => print("User Added"))
  //       .catchError((error) => print("Failed to add booking: $error"));
  // }

  final controllerLocation = TextEditingController();
  final controllerAmount = TextEditingController();
  final controllerService = TextEditingController();
  final controllerName = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Add Booking'),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextField(
              controller: controllerLocation,
              decoration: decoration('Location'),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: controllerAmount,
              decoration: decoration('Amount'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: controllerService,
              decoration: decoration('Service'),
              //keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: controllerName,
              decoration: decoration('Name'),
              //keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                ///var firebaseUser = FirebaseAuth.instance.currentUser;
                Map<String, dynamic> data = {
                  "field1": controllerLocation.text,
                  "field2": controllerAmount.text,
                  "field3": controllerService.text,
                  "field4": controllerName.text,
                };
                FirebaseFirestore.instance.collection("test").add(data);
              },
              child: Text('Book'),
            ),
          ],
        ),
      );

  InputDecoration decoration(String label) => InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      );

  // Future createUser(User user) async {
  //   final docUser = FirebaseFirestore.instance.collection('test').doc();
  //   user.id = docUser.id;

  //   final json = user.toJson();
  //   await docUser.set(json);
  // }
}
