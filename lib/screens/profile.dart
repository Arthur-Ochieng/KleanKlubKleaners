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
    const user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          // ProfileWidget(
          //   imagePath: user.imagePath,
          //   onClicked: () async{},
          // ),
        ],
      ),
    );
  }
}




