import 'package:flutter/material.dart';

class Test3Page extends StatefulWidget {
  const Test3Page({Key? key}) : super(key: key);

  @override
  State<Test3Page> createState() => _Test3PageState();
}

class _Test3PageState extends State<Test3Page> {
  DateTime dateTime = DateTime(2022, 12, 24, 5, 30);

  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');

    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Date and Time',
                style: TextStyle(fontSize: 32),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                          '${dateTime.year}/${dateTime.month}/${dateTime.day} $hours:$minutes'),
                      onPressed: pickDateTime,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return; // pressed "Cancel"

    TimeOfDay? time = await pickTime();
    if (time == null) return; //pressed "Cancel"

    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    setState(() => this.dateTime = dateTime);
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));
}
