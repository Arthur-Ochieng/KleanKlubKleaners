import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kkservices/screens/bookings/cleaner_details.dart';

class ConfirmTruce extends StatefulWidget {
  final Map<String, dynamic> data;
  const ConfirmTruce({Key? key, required this.data}) : super(key: key);

  @override
  State<ConfirmTruce> createState() => _ConfirmTruceState();
}

class _ConfirmTruceState extends State<ConfirmTruce> {
  String? userID = "";
  late String? test;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  Map<String, dynamic> data = {};
  @override
  void initState() {
    super.initState();
    data = widget.data;
    userID = currentUser?.uid;
    test = currentUser?.uid;
  }

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .where('type', isEqualTo: "cleaner")
      //.doc(uid)
      .snapshots();
  final status = "pending";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: const Text("Available Cleaners"),
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
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4 - 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffEBF6FF),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 20,
                        right: -60,
                        child: Image.asset(
                          'assets/icons/KK.png',
                          width: MediaQuery.of(context).size.width * 0.60,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              cleanerData['firstName'] +
                                  ' ' +
                                  cleanerData['secondName'],
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(cleanerData['email'],
                                //'${_cleaner.secondName}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                )),
                            const SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Color(0xff4E295B),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  cleanerData['ratings'],
                                  style: const TextStyle(
                                    color: Color(0xff4E295B),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            MaterialButton(
                              onPressed: () {
                                data['cleaner'] = cleanerData['firstName'];
                                data['cleaner_uid'] = cleanerData['uid'];
                                data['client_uid'] = userID;
                                data['client'] = currentUser?.displayName;
                                data['status'] = status;
                                //print(cleaner_data);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DisplayDetails(
                                            data: data,
                                            cleanerData: cleanerData)));
                              },
                              color: const Color(0xff4E295B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'View Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}

Widget buildCard(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.blueAccent,
    body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Available Cleaners",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


