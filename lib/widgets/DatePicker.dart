import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kkservices/widgets/ButtonHeaderWidget.dart';

class DatePicker extends StatefulWidget {
  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime ? date;

  String getText() {
    if (date == null) {
      return 'Select Date';
    } else {
      return DateFormat('MM/dd/yyyy').format(date!);
    }
  }
  @override
  Widget build(BuildContext context) => ButtonHeaderWidget(
        title: 'Date',
        text: getText(),
        onClicked: () => pickDate(context),
      );

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;
    setState(() => date = newDate);
  }
}
