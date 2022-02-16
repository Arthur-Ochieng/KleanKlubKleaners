import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kkservices/screens/login_screen.dart';
import 'package:kkservices/screens/services.dart';
import "package:latlong2/latlong.dart" as latLng;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Klean Klub Services"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: FlutterMap(
              options: MapOptions(
                center: latLng.LatLng(-1.284946, 36.822386),
                zoom: 15.0,
              ),
              layers: [
                TileLayerOptions (
                  urlTemplate: "https: //{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 15,
            right: 15,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(253, 190, 190, 186),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Search for a service',
                ),
              ),
            ),
          )
        ],
        // child: Padding(
        //   padding: const EdgeInsets.all(20),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: <Widget>[
        //       SizedBox(
        //         height: 150,
        //         child: Image.asset(
        //           "assets/KK.png",
        //           fit: BoxFit.contain,
        //         ),
        //       ),
        //       const Text(
        //         "Wagwan",
        //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //       ),
        //       const SizedBox(
        //         height: 10,
        //       ),
        //       const Text(
        //         "Name",
        //         style: TextStyle(
        //           color: Colors.black54,
        //           fontWeight: FontWeight.w500,
        //         ),
        //       ),
        //       const Text(
        //         "Email",
        //         style: TextStyle(
        //           color: Colors.black54,
        //           fontWeight: FontWeight.w500,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('UserName'),
            ),
            ListTile(
              title: const Text('Notifications'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Wallet'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const ServicesPage()));
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
