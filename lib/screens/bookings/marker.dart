import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kkservices/screens/bookings/services.dart';

class MarkerPage extends StatefulWidget {
  const MarkerPage({Key? key}) : super(key: key);

  @override
  State<MarkerPage> createState() => _MarkerState();
}

class _MarkerState extends State<MarkerPage> {
  GoogleMapController? controller;
  LatLng _markerPos = const LatLng(-1.286389, 36.817223);

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId? selectedMarker;
  int _markerIdCounter = 1;
  LatLng? markerPosition;

  void onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }

// ,
  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(-1.286389, 36.817223),
    zoom: 14.4746,
  );

  List<String> bottomMenus = [
    "Laundry",
    "Carpet",
    "Dusting",
    "All",
  ];

  List<IconData> bottomMenusIcons = [
    Icons.dry_cleaning,
    Icons.house,
    Icons.wash,
    Icons.cleaning_services,
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Stack(
        
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: kGooglePlex,
            onMapCreated: onMapCreated,
            markers: Set<Marker>.of(markers.values),
            onTap: (LatLng pos) {
              const String markerIdVal = 'marker_id_1';
              _markerIdCounter++;
              const MarkerId markerId = MarkerId(markerIdVal);
              final Marker marker = Marker(
                markerId: markerId,
                position: LatLng(
                  pos.latitude,
                  pos.longitude,
                ),
              );
          
              setState(() {
                _markerPos = pos;
                markers[markerId] = marker;
              });
            },
          ),      
          // Positioned(
          //   top: 50,
          //   left: 20,
          //   child: IconButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     icon: const Icon(
          //       Icons.arrow_back_ios,
          //       color: Colors.blueAccent,
          //     ),
          //   ),
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
                children:[
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.my_location,
                          color: Colors.black87,
                        ),
                        hintText: "Pick Location of Service",
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(bottomMenus.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 50,
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? const Color(0xff3C2593)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Row(
                              children: [
                                selectedIndex == index
                                    ? Icon(
                                        bottomMenusIcons[index],
                                        color: Colors.white,
                                        size: 30,
                                      )
                                    : Container(),
                                SizedBox(
                                  width: selectedIndex == index ? 5 : 0,
                                ),
                                Text(
                                  bottomMenus[index],
                                  style: TextStyle(
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : const Color(0xff3C2593),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Map<String, dynamic> data = {"lat": _markerPos.latitude, "lng": _markerPos.longitude};
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServicesPage(data: data),
                          ));
                      //print(_markerPos);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff3C2593),
                    ),
                    child: const Center(
                      child: Text("Confirm Location"),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
