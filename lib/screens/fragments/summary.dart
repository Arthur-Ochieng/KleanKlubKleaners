import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookingSummary extends StatefulWidget {
  const BookingSummary({ Key? key }) : super(key: key);

  @override
  State<BookingSummary> createState() => _BookingSummaryState();
}

class _BookingSummaryState extends State<BookingSummary> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  final _bookingStream = FirebaseFirestore.instance
      .collection('booking')
     // .doc(userId)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

      ), 
    );
  }
}