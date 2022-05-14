import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kkservices/screens/bookings/summary.dart';

class DisplayDetails extends StatefulWidget {
  final Map<String, dynamic> data;
  final Map<String, dynamic> cleanerData;
  const DisplayDetails(
      {Key? key, required this.data, required this.cleanerData})
      : super(key: key);

  @override
  State<DisplayDetails> createState() => _DisplayDetailsState();
}

class _DisplayDetailsState extends State<DisplayDetails> {
  Map<String, dynamic> data = {};
  Map<String, dynamic> cleanerData = {};
  @override
  void initState() {
    super.initState();
    data = widget.data;
    cleanerData = widget.cleanerData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cleaner's Details"),
      ),
      body: Column(children: <Widget>[
        ListTile(
          title: Text(
              cleanerData['firstName']! + ' ' + cleanerData['secondName']),
          subtitle: Text(cleanerData['email']!),
          trailing: ElevatedButton(
            onPressed: () {
             
              FirebaseFirestore.instance
                  .collection("booking")
                  .add(data)
                  .then((value) {
                data['documentID'] = value.id;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BookingSummary(data: data)));
              });
              //data['cleaner'] = cleaner_data;
            },
            child: const Text("Confirm Booking"),
          ),
        ),
      ]),
    );
  }
}
