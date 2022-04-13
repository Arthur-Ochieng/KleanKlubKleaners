import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kkservices/models/auth.dart';
import 'package:kkservices/models/user_model.dart';

class CleanersPage extends StatefulWidget {
  const CleanersPage({Key? key}) : super(key: key);

  @override
  State<CleanersPage> createState() => _CleanersPageState();
}

class _CleanersPageState extends State<CleanersPage> {
  List<Object> _cleanersList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: _cleanersList.length,
          itemBuilder: (context, index) {
            return Text("$index");
          },
        ),
      ),
    );
  }

  Future getCleanerList() async {
    final uid = AuthService().currentUser?.uid;
    var data = await FirebaseFirestore.instance.collection("users").doc().get();
    // setState(() {
    //   _cleanersList =
    //       List.from(data.docs.map((doc) => UserModel.fromSnapshot(doc)));
    // });
    // StreamBuilder<QuerySnapshot>(
    //   stream: ,
    //   builder: ,
    // );
  }
}
