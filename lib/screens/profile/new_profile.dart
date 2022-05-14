import 'package:flutter/material.dart';
import 'package:kkservices/screens/profile/e_profile.dart';
import 'package:kkservices/widgets/numbers_widget.dart';

class ProfileUIPage extends StatefulWidget {
  const ProfileUIPage({Key? key}) : super(key: key);

  @override
  State<ProfileUIPage> createState() => _ProfileUIPageState();
}

class _ProfileUIPageState extends State<ProfileUIPage> {
  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: bottom),
                  color: Colors.grey,
                  child: Image.asset(
                    "assets/icons/clean.jpg",
                    width: double.infinity,
                    height: coverHeight,
                  )),
              Positioned(
                top: top,
                child: CircleAvatar(
                    radius: profileHeight / 2,
                    backgroundColor: Colors.grey.shade800,
                    backgroundImage: const AssetImage("assets/icons/KK.png")),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 8),
              const Text(
                "Arthur Ochieng",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Flutter Software Engineer",
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 7),
              const Divider(),
              const SizedBox(height: 7),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff172B4D),
                ),
                onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfilePage(),
                    ));
                },
                child: Container(
                  width: 50,
                  child: const Center(
                    child: Text("Edit"),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Expanded(
                    child: ListTile(
                      title: Text(
                        "4",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff525E7E),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Jobs Posted",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff525E7E),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const[
                    Text(
                      "About",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Flutter Software Engineer and Google Developer",
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text("+ 254 712 815 240"),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.blueGrey,
                      ),
                    ),

                    ListTile(
                      title: Text("History"),
                      leading: Icon(Icons.history),
                    ),
                    ListTile(
                      title: Text("Address"),
                      leading: Icon(Icons.my_location),
                    ),
                    ListTile(
                      title: Text("Wallet"),
                      leading: Icon(Icons.account_balance_wallet),
                    ),
                    ListTile(
                      title: Text(
                        "Logout",
                        style: TextStyle(color: Colors.red),
                      ),
                      leading: Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 16),
                    //NumbersWidget()
                  ],
                 
                ),
              ),
            ],
          )
        ],

      ),
    );
  }
}
