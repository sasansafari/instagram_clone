import 'package:flutter/material.dart';

import '../../widgets/special_derawer.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
       const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('UserProfileScreen'),
          ),
        ),
      );
  }
}
