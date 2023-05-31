import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tec/route/names.dart';
import 'package:tec/screens/mainscreen/post_screen.dart';

import '../../widgets/homeScreen_likes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeScreenLikes(
              profile_picture: "assets/Oval.png",
              likes: ["craing_love", "craing_love", "craing_love"],
            ),
            Text(
              "home - 0 stack",
              style: TextStyle(fontSize: 28),
            ),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PostScreen())),
                child: Text("next"))
          ],
        ),
      ),
    ));
  }
}
