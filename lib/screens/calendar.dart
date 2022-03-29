import 'package:flutter/material.dart';
import 'package:kkservices/widgets/DatePicker.dart';
import 'package:kkservices/widgets/TimePicker.dart';
import 'package:kkservices/widgets/date_time_picker.dart';

class PickerWidget extends StatefulWidget {
  const PickerWidget({Key? key}) : super(key: key);

  @override
  State<PickerWidget> createState() => _PickerWidgetState();
}

class _PickerWidgetState extends State<PickerWidget> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: buildBottomBar(),
        body: buildPages(),
      );

  Widget buildBottomBar() {
    final style = TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: Text(
            'DatePicker',
            style: style,
          ),
          //title: Text('Basic'),
        ),
        BottomNavigationBarItem(
          icon: Text(
            'DatePicker',
            style: style,
          ),
          //title: Text('Basic'),
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
      return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DatePicker(),
              SizedBox(height: 24,),
              TimePicker(),
              SizedBox(height: 24,),              
            ],
          ),
        ),
      );
      case 1:
      return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DateTimePicker(),
            ],
          ),
        ),
      );
      default: 
      return Container();
    }
  }
}
