import 'package:flutter/material.dart';
import 'package:tec/screens/mainscreen/main_screen.dart';
 import 'package:tec/screens/splash.dart';
 
import 'names.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Screens.root: (context) => const Splash(),
  Screens.mainScreen: (context) => const MainScreen(),
 };
