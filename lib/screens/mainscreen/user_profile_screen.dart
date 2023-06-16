import 'package:flutter/material.dart';

import '../../widgets/special_derawer.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        endDrawer: Container(
          // color: Colors.white,
          width: MediaQuery.of(context).size.width * 0.65,
          child: const CustomDrawer(),
        ),
        body: Center(
          child: Text('UserProfileScreen'),
        ),
      ),
    );
  }
}
