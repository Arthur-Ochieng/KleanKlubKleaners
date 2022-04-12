import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kkservices/widgets/app_text_normal.dart';
import 'package:kkservices/widgets/constants.dart';

class MyDrawer extends StatefulWidget {
  //getting selected menu to home page
  final Function(int) onMenuTap;
  final int indexPage;
  const MyDrawer({
    Key? key,
    required this.indexPage,
    required this.onMenuTap,
  }) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  //initial index
  int initialIndex = 0;

  //active and inactive styles
  final activeTextStyle = const TextStyle(color: Colors.white);
  final inactiveTextStyle = const TextStyle(color: Colors.black);
  final activeDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: buttonColor,
  );

  List<String> menus = [
    "Booking",
    "Services",
    "Notifications",
    "FeedBack",
    "Profile",
  ];
  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.design_services,
    Icons.message,
    Icons.history,
    Icons.person,
  ];

  //Variable
  // String displayName = "";

  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // FirebaseAuth auth = FirebaseAuth.instance;
  // User user = FirebaseAuth.instance.currentUser!;

  // @override
  // void initState() {
  //   super.initState();
  //   //displayName = user.displayName!;
  //   if (user != null) {
  //     displayName = user.displayName!;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/icons/KK.png",
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: AppTextNormal(
                  //text: displayName,
                  text: ("Name"),
                  color: Colors.black54,
                  size: 25,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          //generating the menus
          Column(
            children: List.generate(
              menus.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                    decoration: widget.indexPage == index
                        ? activeDecoration
                        : const BoxDecoration(),
                    child: ListTile(
                      onTap: () {
                        widget.onMenuTap(index);
                      },
                      title: Text(
                        menus[index],
                        style: widget.indexPage == index
                            ? activeTextStyle
                            : inactiveTextStyle,
                      ),
                      leading: Icon(
                        icons[index],
                        color: widget.indexPage == index
                            ? Colors.white
                            : Colors.black54,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Colors.black54,
            thickness: 0.5,
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(top: 8, left: 20),
            child: Text("DOCUMENTATION"),
          ),
          const SizedBox(height: 10),
          const ListTile(
            title: Text("Privacy Policy"),
            leading: Icon(Icons.security_outlined),
          ),
          const ListTile(
            title: Text("Share"),
            leading: Icon(Icons.share),
          ),
          const ListTile(
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
            leading: Icon(
              Icons.logout,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  // Future<DocumentReference> getUserDoc() async {
  //   final FirebaseAuth _auth = FirebaseAuth.instance;
  //   final Firestore _firestore = Firestore.instance;

  //   FirebaseUser user = await _auth.currentUser();
  //   DocumentReference ref = _firestore.collection("users").document(user.uid);
  //   return ref;
  // }
}
