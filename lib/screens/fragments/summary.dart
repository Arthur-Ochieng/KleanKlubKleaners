import 'package:flutter/material.dart';
import 'package:kkservices/screens/fragments/cleaners.dart';
import 'package:kkservices/screens/home_page.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff190E45),
              Color(0xff5339A5),
              Color(0xff5E43AE),
            ]),
          ),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        preferredSize: Size(_size.width, 50),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // GoogleMap(
            //   mapType: MapType.normal,
            //   initialCameraPosition: _kGooglePlex,
            //   onMapCreated: (GoogleMapController controller) {
            //     _controller.complete(controller);
            //   },
            //   myLocationEnabled: true,
            //   zoomControlsEnabled: false,
            // ),
            Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: TextFormField(
                        readOnly: true,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 8),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Icons.near_me,
                            color: Colors.black87,
                          ),
                          hintText: "Embakasi, Donholm",
                        ),
                      ),
                    ),
                    // const Divider(
                    //   thickness: 0.5,
                    //   color: Colors.black87,
                    // ),
                    // TextFormField(
                    //   readOnly: true,
                    //   decoration: const InputDecoration(
                    //     contentPadding: EdgeInsets.only(left: 8),
                    //     border: OutlineInputBorder(
                    //       borderSide: BorderSide.none,
                    //     ),
                    //     prefixIcon: Icon(
                    //       Icons.near_me,
                    //       color: Colors.black87,
                    //     ),
                    //     hintText: "Nairobi, Kenya",
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 50,
              height: 100,
              child: Card(
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, bottom: 5.0, top: 12),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.dry_cleaning,
                                  color: Color(0xff3C2593),
                                ),
                                SizedBox(width: 8.0),
                                Text("Laundry")
                              ],
                            ),
                          ),
                          // ListTile(
                          //   contentPadding: EdgeInsets.only(left: 16, right: 0),
                          //   leading: Icon(
                          //     Icons.local_taxi,
                          //     color: Color(0xff3C2593),
                          //   ),
                          //   title: Text("Mini Ride"),
                          // ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              bottom: 10,
                            ),
                            // child: Text("4 people allowed"),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              bottom: 10,
                            ),
                            child: Text("Estimate"),
                          ),
                        ])),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff3C2593),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text("View Bill"),
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Text("KSHS.251.55")),
                      ]),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 20,
              right: 20,
              child: Container(
                height: 50,
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Est, Time: 28 min"),
                            SizedBox(
                              height: 2,
                            ),
                            Text("Distance 4kms"),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Cleaners()));
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.arrow_forward),
                          SizedBox(width: 10),
                          Text("Schedule"),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff3C2593),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
