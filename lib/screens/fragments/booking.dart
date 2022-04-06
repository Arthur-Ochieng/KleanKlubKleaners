import 'package:flutter/material.dart';
import 'package:kkservices/screens/fragments/marker.dart';
import 'package:kkservices/widgets/category_card.dart';
import 'package:kkservices/widgets/constants.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Hey Arthur",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Cleaning Services at your Doorstep",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff616888),
                ),
              ),
              const SizedBox(height: 30),
              MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.grey[200],
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for a service',
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Categories',
                    style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    child: const Text(
                      'Book Now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xff6E8AFA),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const MarkerPage())
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: categoryData.map((category) {
                  return CategoryCard(category['title'],
                      category['courseAmount'], category['imageUrl']);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
