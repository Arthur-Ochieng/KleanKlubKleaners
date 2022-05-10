import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kkservices/utilis/user_preferences.dart';
import 'package:kkservices/widgets/profile_widget.dart';

class DemoProfilePage extends StatefulWidget {
  const DemoProfilePage({Key? key}) : super(key: key);

  @override
  State<DemoProfilePage> createState() => _DemoProfilePageState();
}

class _DemoProfilePageState extends State<DemoProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          )
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    const icon = CupertinoIcons.moon_stars;
    return AppBar(
      leading: const BackButton(),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(icon),
        ),
      ],
    );
  }
}
