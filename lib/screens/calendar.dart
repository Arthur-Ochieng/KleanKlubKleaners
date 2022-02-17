import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarPage extends StatelessWidget {
  const CalendarPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const calendarPage(),
      theme: ThemeData(
        fontFamily: 'ubuntu'
      ),
    );
  }
}

class calendarPage extends StatefulWidget {
  const calendarPage({ Key? key }) : super(key: key);

  @override
  _calendarPageState createState() => _calendarPageState();
}

class _calendarPageState extends State<calendarPage> {
  //CalendarController _calendarController = CalendarController();
  @override
  void initState(){
    //TODO: Implement InitState
    super.initState();
  //  _calendarController = CalendarController();
  }
  void dispose(){
    //TODO: Implement Dispose
  //  _calendarController.dispose();
    super.dispose();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}