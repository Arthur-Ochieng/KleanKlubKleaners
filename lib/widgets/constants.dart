import 'package:flutter/material.dart';

final List<Color> gradientColors = [
  const Color(0xff281483),
  const Color(0xff8F6ED5),
  const Color(0xffD782D9),
];
Color bubbleColor = const Color(0x26FFFFFF);
Color buttonColor = const Color.fromARGB(255, 96, 114, 212);

const categoryData = [
  {
    'title': 'Laundry',
    'courseAmount': 23,
    'imageUrl': 'assets/images/cat1.png'
  },
  {
    'title': 'Cleaning',
    'courseAmount': 15,
    'imageUrl': 'assets/images/cat2.png'
  },
  {
    'title': 'Dusting',
    'courseAmount': 16,
    'imageUrl': 'assets/images/cat3.png'
  },
  {
    'title': 'Vaccum',
    'courseAmount': 17,
    'imageUrl': 'assets/images/cat4.png'
  },
];

const courseContent = [
  {'number': '01', 'title': 'Welcome to Home Cleaning', 'time': '5:35 mins'},
  {'number': '02', 'title': 'Committed to serving you', 'time': '5:35 mins'},
  {'number': '03', 'title': 'At very lenient prices', 'time': '5:35 mins'},
  {'number': '04', 'title': 'WIth much convenience', 'time': '5:35 mins'},
];
