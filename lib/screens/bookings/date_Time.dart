import 'package:animated_textformfields/animated_textformfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kkservices/screens/bookings/available_cleaners.dart';

class InstructionScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const InstructionScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<InstructionScreen> createState() => _DebugPageState();
}

class _DebugPageState extends State<InstructionScreen> {
  Map<String, dynamic> data = {};
  @override
  void initState() {
    super.initState();
    data = widget.data;
  }

  FocusNode myFocusNode = FocusNode();
  FocusNode myFocusNode1 = FocusNode();
  FocusNode myFocusNode2 = FocusNode();
  FocusNode myFocusNode3 = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey();

  //editing controller
  final instructionEditingController = TextEditingController();
  DateTime dateTime = DateTime(2022, 12, 24, 5, 30);

  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 10),
                child: Row(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 26,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text("Booking",
                      style: GoogleFonts.nunitoSans(
                        color: Colors.black,
                        fontSize: 26,
                      ))
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      ClipRRect(child: Image.asset("assets/icons/clean.jpg")),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 250),
                        child: Text(
                          "Pick Date and Time",
                          style: GoogleFonts.nunitoSans(
                              color: Colors.black, fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 260),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              child: Text(
                                  '${dateTime.year}/${dateTime.month}/${dateTime.day} $hours:$minutes'),
                              onPressed: pickDateTime,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 250),
                        child: Text(
                          "Give Instructions",
                          style: GoogleFonts.nunitoSans(
                              color: Colors.black, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 100),
                        child: AnimatedTextFormField(
                          controller: instructionEditingController,
                          width: MediaQuery.of(context).size.width * 0.875,
                          maxLines: 100,
                          height: 200,
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          focusNode: myFocusNode,
                          validator: (val) {
                            if (val.isEmpty) {
                              return "please enter instruction";
                            }
                            return null;
                          },
                          cornerRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 200),
                        child: AnimatedButton(
                            height: 50,
                            width: 200,
                            isReverse: true,
                            selectedTextColor: Colors.black,
                            transitionType: TransitionType.LEFT_TO_RIGHT,
                            backgroundColor: Colors.blueAccent,
                            borderColor: Colors.white,
                            borderRadius: 20,
                            borderWidth: 2,
                            text: "Book Now",
                            onPress: () {
                              submitField();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ConfirmTruce(data: data)));
                            }),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return; // pressed "Cancel"

    TimeOfDay? time = await pickTime();
    if (time == null) return; //pressed "Cancel"

    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    setState(() {
      this.dateTime = dateTime;
      data['date'] = date.year.toString() +
          '/' +
          date.month.toString() +
          '/' +
          date.day.toString();
      data['time'] = time.hour.toString() + ':' + time.minute.toString();
    });
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2022),
        lastDate: DateTime(2100),
      );

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));

  void submitField() {
    var instruct = instructionEditingController.text;
    setState(() {
      data['instructions'] = instruct;
    });
  }
}
