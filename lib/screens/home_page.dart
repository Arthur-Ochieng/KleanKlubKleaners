import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kkservices/screens/feedback.dart';
import 'package:kkservices/screens/fragments/booking.dart';
import 'package:kkservices/screens/fragments/cleaners.dart';
import 'package:kkservices/screens/fragments/cleaners.dart';
import 'package:kkservices/screens/fragments/details.dart';
import 'package:kkservices/screens/fragments/history.dart';
import 'package:kkservices/screens/fragments/marker.dart';
import 'package:kkservices/screens/fragments/notifications.dart';
import 'package:kkservices/screens/fragments/profile.dart';
import 'package:kkservices/screens/fragments/services.dart';
import 'package:kkservices/screens/payment/payment.dart';
import 'package:kkservices/screens/settings.dart';
import 'package:kkservices/widgets/drawer.dart';

//import 'package:overlay_container/overlay_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //page selected
  int indexPage = 0;
  final List fragments =  [
    BookingPage(),
    PaymentPage(),
    FeedBackPage(),
    SettingsPage(),
    ProfilePage(),
    Cleaners(),
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
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _toggleDropdown,
            icon: const Icon(
              Icons.notifications,
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
