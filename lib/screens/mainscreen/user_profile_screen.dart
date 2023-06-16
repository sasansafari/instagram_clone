import 'package:flutter/material.dart';
import 'package:tec/screens/mainscreen/explore_screen.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import '../../widgets/custom_drawer.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  var showDrawer = false;

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SliderDrawer(
          slideDirection: SlideDirection.RIGHT_TO_LEFT,
          //  key: _key,
          appBar: SliderAppBar(
            appBarColor: Colors.white,
            title: Text(
              'Name',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
          slider: CustomDrawer(),
          child: Placeholder(),
        ),
      ),
    );
  }
}
