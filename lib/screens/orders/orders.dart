import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kkservices/screens/orders/order_summary.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({ Key? key }) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  
  String? userID = "";
  late String? test;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  void initState() {
    super.initState();
    userID = currentUser?.uid;
    test = currentUser?.uid;
  }
  
  Widget realTimeOrders(BuildContext context) {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
  .collection('booking')
  //.doc()
  .where('client_uid', isEqualTo: userID)
  .snapshots();

  return Container(
    child: StreamBuilder<QuerySnapshot>(
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
            Map<String, dynamic> orderData =
                document.data()! as Map<String, dynamic>;
  
            return ListTile(
              title: Text(orderData['cleaner']! + " " + " ( " + orderData['status']! + " ) "),
              subtitle: Text(orderData['service']!),

              
              trailing: ElevatedButton(
                onPressed: () {
                  //print(bookingData);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderSummary(
                          orderData: orderData,)));
                },
                child: const Text("View Details"),
              ),
            );
          }).toList(),
        );
      },
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookings Made"),
      ),
      body: realTimeOrders(context),
    );
  }
}






  
