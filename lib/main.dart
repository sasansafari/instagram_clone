import 'package:flutter/material.dart';
 import 'package:tec/route/names.dart';
 import 'package:tec/route/routes.dart';
import 'package:tec/screens/mainscreen/user_profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserProfileScreen(),
      //title: 'Watch Store',
      //initialRoute:Screens.root,
      //routes: routes,
    );
  }
}
