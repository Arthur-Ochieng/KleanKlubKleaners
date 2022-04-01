import 'package:flutter/material.dart';
import 'package:kkservices/screens/calendar.dart';
import 'package:kkservices/widgets/DatePicker.dart';

class ServicesPage extends StatefulWidget {
  final Map<String, dynamic> data;
  const ServicesPage({Key? key, required this.data}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  String selectedType = "initial";
  String selectedFrequency = "monthly";

  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      // appBar: AppBar(
      //   title: const Text("Your Plan", style: TextStyle(
      //     color: Colors.white,
      //     fontWeight: FontWeight.w700,
      //   ),),
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                //borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Selected Cleaning",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          changeCleaningType("initial");
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 140,
                              width: MediaQuery.of(context).size.width * 0.43,
                              decoration: const BoxDecoration(
                                color: Color(0xffdfdeff),
                                image: DecorationImage(
                                  image: AssetImage("assets/icons/img1.png"),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Initial Cleaning",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 10,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffededed),
                              ),
                              child: (selectedType == "Initial")
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Colors.blueAccent,
                                      size: 30,
                                    )
                                  : Container(),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeCleaningType("upkeep");
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 130,
                              width: MediaQuery.of(context).size.width * 0.43,
                              decoration: const BoxDecoration(
                                color: Color(0xffdfdeff),
                                image: DecorationImage(
                                  image: AssetImage("assets/icons/img2.png"),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Upkeep Cleaning",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 10,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffededed),
                              ),
                              child: (selectedType == "upkeep")
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: Colors.blueAccent,
                                      size: 30,
                                    )
                                  : Container(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Select Service",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          changeFrequency("laundry");
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedFrequency == "laundry")
                              ? const BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))
                              : BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.3)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                          child: Center(
                            child: Text(
                              "Laundry",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: (selectedFrequency == "laundry")
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeFrequency("dusting");
                        },
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedFrequency == "dusting")
                              ? const BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))
                              : BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.3)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                          child: Center(
                            child: Text(
                              "Dusting",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: (selectedFrequency == "dusting")
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          changeFrequency("cleaning");
                        },
                        child: Container(
                          height: 50,
                          width: 90,
                          decoration: (selectedFrequency == "cleaning")
                              ? const BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))
                              : BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.3)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                          child: Center(
                            child: Text(
                              "Cleaning",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: (selectedFrequency == "cleaning")
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Seleted Extras",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      extraWidget("fridge", "Inside Fridge", true),
                      extraWidget("organise", "Organise", false),
                      extraWidget("blind", "Small Blinds", false),
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: openCalendarPage,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 8),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.blueAccent),
                          child: const Text(
                            "Next",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changeCleaningType(String type) {
    selectedType = type;
    setState(() {});
  }

  void changeFrequency(String frequency) {
    selectedFrequency = frequency;
    setState(() {
      data['service'] = frequency;
      //print(frequency);
    });
  }

  Column extraWidget(String img, String name, bool isSelected) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent,
              ),
              child: Container(
                margin: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/icons/$img.png"),
                        fit: BoxFit.contain)),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: (isSelected == true)
                  ? Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: const Center(
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.purple,
                        ),
                      ))
                  : Container(),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.w700),
        )
      ],
    );
  }

  void openCalendarPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DatePicker(data: data)));
  }
}
