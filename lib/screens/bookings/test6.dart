import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kkservices/screens/bookings/summary.dart';

class DisplayDetails extends StatefulWidget {
  final Map<String, dynamic> data;
  final Map<String, dynamic> cleaner_data;
  const DisplayDetails(
      {Key? key, required this.data, required this.cleaner_data})
      : super(key: key);

  @override
  State<DisplayDetails> createState() => _DisplayDetailsState();
}

class _DisplayDetailsState extends State<DisplayDetails> {
  Map<String, dynamic> data = {};
  Map<String, dynamic> cleaner_data = {};
  @override
  void initState() {
    super.initState();
    data = widget.data;
    cleaner_data = widget.cleaner_data;
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
              cleaner_data['firstName']! + ' ' + cleaner_data['secondName']),
          subtitle: Text(cleaner_data['email']!),
          trailing: ElevatedButton(
            onPressed: () {
             
              FirebaseFirestore.instance
                  .collection("booking")
                  .add(data)
                  .then((value) {
                data['documentID'] = value.id;
                print(value.id);
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
