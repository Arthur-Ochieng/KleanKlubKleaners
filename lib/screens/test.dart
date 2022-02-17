import 'package:flutter/material.dart';
import 'package:kkservices/screens/calendar.dart';


class Testing extends StatefulWidget {
  const Testing({ Key? key }) : super(key: key);

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  String selectedType = "initial";
  String selectedFrequency = "monthly";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: const Text("Your Plan", style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  const Text("Selected Cleaning", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){changeCleaningType("initial");},
                        child: Column(
                          children: [
                            Container(
                              height: 140,
                              width: MediaQuery.of(context).size.width * 0.43,
                              decoration: const BoxDecoration(
                                color: Color(0xffdfdeff),
                                image: DecorationImage(
                                  image: AssetImage("/img1.png"),
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            const Text("Initial Cleaning", style: TextStyle(
                              fontWeight: FontWeight.w600
                            ),),
                            const SizedBox(height: 10,),
                            Container(
                              height: 10,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffededed),
                              ),
                              child: (selectedType == "Initial") ? const Icon(Icons.check_circle,
                              color: Colors.blueAccent,
                              size: 30,): Container(),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){changeCleaningType("upkeep");},
                        child: Column(
                          children: [
                            Container(
                              height: 140,
                              width: MediaQuery.of(context).size.width * 0.43,
                              decoration: const BoxDecoration(
                                color: Color(0xffdfdeff),
                                image: DecorationImage(
                                  image: AssetImage("/img2.png"),
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            const Text("Upkeep Cleaning", style: TextStyle(
                              fontWeight: FontWeight.w600
                            ),),
                            const SizedBox(height: 10,),
                            Container(
                              height: 10,
                              width: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffededed),
                              ),
                              child: (selectedType == "upkeep") ? const Icon(Icons.check_circle,
                              color: Colors.blueAccent,
                              size: 30,): Container(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text("Selected Frequency", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){changeFrequency("weekly");},
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedFrequency == "weekly") ? const BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ) : BoxDecoration(
                            border: Border.all(color: Colors.black.withOpacity(0.3)),
                            borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child: Center(
                            child: Text("Weekly", style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: (selectedFrequency == "weekly") ? Colors.white : Colors.black
                            ),),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){changeFrequency("biweekly");},
                        child: Container(
                          height: 50,
                          width: 110,
                          decoration: (selectedFrequency == "biweekly") ? const BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ) : BoxDecoration(
                            border: Border.all(color: Colors.black.withOpacity(0.3)),
                            borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child: Center(
                            child: Text("Bi-Weekly", style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: (selectedFrequency == "biweekly") ? Colors.white : Colors.black
                            ),),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){changeFrequency("monthly");},
                        child: Container(
                          height: 50,
                          width: 90,
                          decoration: (selectedFrequency == "monthly") ? const BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ) : BoxDecoration(
                            border: Border.all(color: Colors.black.withOpacity(0.3)),
                            borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                          child: Center(
                            child: Text("Monthly", style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: (selectedFrequency == "monthly") ? Colors.white : Colors.black
                            ),),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Text("Seleted Extras", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      extraWidget("fridge", "Inside Fridge", true),
                      extraWidget("organise", "Organise", false),
                      extraWidget("blind", "Small Blinds", false),
                    ],
                  ),
                  // SizedBox(height: 20,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     extraWidget("garden", "Patio", false),
                  //     extraWidget("organise", "Grocery", true),
                  //     extraWidget("blind", "Curtains", false),
                  //   ],
                  // ),
                  Expanded(
                    child: Container(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: openCalendarPage,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.blueAccent
                          ),
                          child: const Text("Next", style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                          ),),
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
  void changeCleaningType(String type){
    selectedType = type;
    setState(() {
      
    });
  }
    void changeFrequency(String frequency){
    selectedFrequency = frequency;
    setState(() {
      
    });
  }
  Column extraWidget(String img, String name, bool isSelected)
  {
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
                    image: AssetImage("/icons/$img.png"),
                    fit: BoxFit.contain
                  )
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: (isSelected == true) ? Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                ),
                child: const Center(
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.purple,
                    ),
                )
              ): Container(),
            )
          ],
        ),
        const SizedBox(height: 5,),
        Text(name, style: const TextStyle(
          fontWeight: FontWeight.w700
        ),)
      ],
    );
  }
  void openCalendarPage()
  {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => const CalendarPage()));
  }
}