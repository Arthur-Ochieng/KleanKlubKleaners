import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kkservices/widgets/appbar_widget.dart';
import 'package:kkservices/models/user.dart';
import 'package:kkservices/utilis/user_preferences.dart';


class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    //const user = UserPreferences.myUser;

    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Stack(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height *0.4,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
              ),
            ),
          ),
          Positioned(
            top: 100,
            bottom: 30,
            right: 30,
            left: 30,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 100),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff172B4D),
                        ),
                        onPressed: (){},
                        child: Container(
                          width: 50,
                          child: const Center(
                            child: Text(
                              "Edit"
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  "4",
                                  style: TextStyle(
                                    color: Color(0xff525E7E),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  "Notifications",
                                  style: TextStyle(
                                    color: Color(0xff525E7E),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.blueGrey,
                        ),
                      ),
                
                      //Personal Info
                      const ListTile(
                        title: Text(
                          "Arthur Ochieng",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: Text(
                          "Nairobi, Kenya",
                          textAlign: TextAlign.center,
                        ),
                      ),

                      const Text(
                        "+ 254 712 815 240",
                      ),
                
                      const Padding(
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
                
                      const ListTile(
                        title: Text("History"),
                        leading: Icon(Icons.history),
                      ),
                      const ListTile(
                        title: Text("Address"),
                        leading: Icon(Icons.my_location),
                      ),
                      const ListTile(
                        title: Text("Wallet"),
                        leading: Icon(Icons.account_balance_wallet),
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
                
                    ]
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: MediaQuery.of(context).size.width /2 - 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                "assets/icons/KK.png",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
              
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size){
      Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height - 30)
      ..lineTo(size.width, 0)
      ..close();
      return path;
    }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
  
}


