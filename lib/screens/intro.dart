import 'package:flutter/material.dart';
import 'package:kkservices/models/services.dart';
import 'package:kkservices/models/services.dart';
import 'package:kkservices/screens/login_screen.dart';
import 'package:kkservices/screens/notifications.dart';
import 'package:kkservices/screens/feedback.dart';


class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = TextEditingController();
  List<Service> Services = allServices;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 30, right:30),
        child: Column(
          children: [
            Row(
              children: [
                 const Text ("Welcome Back",
                  style:  TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Expanded(child: Container()),
                const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                ),
                const SizedBox(width: 10,),
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: Colors.black,
                ),
                const SizedBox(width: 15,),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                ),
                
                //Color: Colors.black
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              children: [
                const Text(
                  "Your Plan",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Expanded(child: Container()),
                const Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(width: 5,),
                const Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.withOpacity(0.8),
                  const Color.fromARGB(255, 250, 250, 250).withOpacity(0.9)
                ],
              ),
                borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  bottomLeft: const Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(80),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 25, right: 180),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    const Text(
                      "Discover",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    const Text(
                      "Cleaning Services",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 25,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(Icons.timer, size: 20, color: Colors.white),
                            const SizedBox(width: 10,),
                            const Text(
                              "We Prioritize Convenience",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),                                 
                        // const Icon(
                        //   Icons.cleaning_services,
                        //   color: Colors.white,
                        //   size: 40,
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              children: const [
                Text(
                  "Services Available",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Expanded(
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: (4.toDouble()/2).toInt(),
                  itemBuilder: (_, i)
                  {
                    return Row(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width-90)/2,
                          height: 170,
                          margin: const EdgeInsets.only(left: 30, bottom: 15, top: 15),
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage("assets/icons/house.png")
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                offset: const Offset(5,5),
                                color: Colors.grey.withOpacity(0.1)
                              ),
                              BoxShadow(
                                blurRadius: 3,
                                offset: const Offset(-5, -5),
                                color: Colors.grey.withOpacity(0.1)
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Home Cleaning",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                           
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width-90)/2,
                          height: 170,
                          margin: const EdgeInsets.only(left: 30, bottom: 15, top: 15),
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage("assets/icons/house.png")
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                offset: const Offset(5,5),
                                color: Colors.grey.withOpacity(0.1)
                              ),
                              BoxShadow(
                                blurRadius: 3,
                                offset: const Offset(-5, -5),
                                color: Colors.grey.withOpacity(0.1)
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Home Cleaning",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                           
                          ),
                        ),
              
                      ],
                    );
                  }
                ),
              )
            )          
          ],
        )
      ),






      // body: Column(
      //   children: <Widget>[
      //     Container(
      //       margin:  const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      //       child: TextField(
      //         controller: controller,
      //         decoration:  InputDecoration(
      //           prefixIcon: const Icon(Icons.search),
      //           hintText: 'Search for a service',
      //           border: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(20),
      //             borderSide: const BorderSide(color: Colors.black),
      //           ),
      //         ),
      //       ),
            
      //     ),
      //   ],

      // ),
      // drawer: Drawer(
      //   // Add a ListView to the drawer. This ensures the user can scroll
      //   // through the options in the drawer if there isn't enough vertical
      //   // space to fit everything.
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text('UserName'),
      //       ),
      //       ListTile(
      //         title: const Text('Notifications'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Wallet'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Profile'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Settings'),
      //         onTap: () {
      //           Navigator.push(
      //             context, 
      //             MaterialPageRoute(
      //               builder: (context) => const ServicesPage()));
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Logout'),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => const LoginScreen()
      //             )
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}