import 'package:flutter/material.dart';

class DisplayDetails extends StatefulWidget {
  final Map<String, dynamic> data;
  final Map<String, dynamic> cleaner_data;
  const DisplayDetails({ Key? key, required this.data, required this.cleaner_data }) : super(key: key);

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
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(cleaner_data['firstName']! +
          ' ' +
          cleaner_data['secondName']),
      subtitle: Text(cleaner_data['email']!),
      trailing: ElevatedButton(
        onPressed: () {
          data['cleaner'] = cleaner_data;
          //print(cleaner_data);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DisplayDetails(
                      data: data, cleaner_data: cleaner_data)));
        },
        child: const Text("View Profile"),
      ),
    );
  }
}