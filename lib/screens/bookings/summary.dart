import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookingSummary extends StatefulWidget {
  final Map<String, dynamic> data;
  const BookingSummary({
    Key? key, 
    required this.data}) : super(key: key);

  @override
  State<BookingSummary> createState() => _BookingSummaryState();
}

class _BookingSummaryState extends State<BookingSummary> {
  String? userID = "";
  late String? test;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  Map<String, dynamic> data = {};
  @override
  void initState() {
    super.initState();
    data = widget.data;
  }


  // @override
  // void initState() {
  //   super.initState();
  //    userID = currentUser?.uid;
  //    test = currentUser?.uid;
  // }

  // Widget realTimeBooking(BuildContext context){

  //     final _bookingStream =
  //     FirebaseFirestore.instance  
  //     .collection('booking')
  //     .where('uid', isEqualTo: userID)
  //     .snapshots();

  //   return StreamBuilder<QuerySnapshot>(
  //     stream: _bookingStream,
  //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
  //       return ListView(
  //         children: snapshot.data!.docs.map((DocumentSnapshot document) {
  //           Map<String, dynamic> cleaner_data =
  //               document.data()! as Map<String, dynamic>;

  //           return ListTile(
  //             title: Text(cleaner_data['service']! +
  //                 ' ' +
  //                 cleaner_data['cleaner']),
  //             subtitle: Text(cleaner_data['date']!),
  //           );
  //         }).toList(),
  //       );
  //     }
  //   );
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Summary"),
      ),
      body: Column(children: <Widget>[
        ListTile(
          title: Text(
              data['service']! + ' ' + data['cleaner']),
          subtitle: Text(data['date']!),
          trailing: ElevatedButton(
            onPressed: () {},
            child: const Text("Proceed to Checkout"),
          ),
        ),
      ]),
    );
  }
}


