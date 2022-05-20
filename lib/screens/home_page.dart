import 'package:flutter/material.dart';
import 'package:kkservices/screens/bookings/booking.dart';
import 'package:kkservices/screens/fragments/history.dart';
import 'package:kkservices/screens/orders/orders.dart';
import 'package:kkservices/screens/profile/new_profile.dart';
import 'package:kkservices/screens/settings/settings.dart';
import 'package:kkservices/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //page selected
  int indexPage = 0;
  final List fragments =  [
    const BookingPage(),
    const OrdersPage(),
    const HistoryPage(),
    const SettingsPage(),
    const ProfileUIPage(),
  ];

  bool _dropdownShown = false;
  void _toggleDropdown() {
    setState(() {
      _dropdownShown = !_dropdownShown;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _toggleDropdown,
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          )
        ],
      ),
      drawer: MyDrawer(
        indexPage: indexPage,
        onMenuTap: (page) {
          Navigator.pop(context);
          setState(() {
            indexPage = page;
          });
        },
      ),
      body: fragments[indexPage],
    );
  }
}
