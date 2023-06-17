import 'package:flutter/material.dart';
import 'package:tec/screens/mainscreen/add_screen/add_screen.dart';
import 'package:tec/screens/mainscreen/login_screen.dart';
import 'package:tec/screens/mainscreen/main_screen.dart';
import 'package:tec/screens/splash.dart';

import '../screens/mainscreen/post_screen.dart';
import 'names.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Screens.root: (context) => const Splash(),
  Screens.mainScreen: (context) => const MainScreen(),
  Screens.addNew: (context) => const AddScreen(),
  Screens.postScreen: (context) => const PostScreen(),
  Screens.loginScreen: (context) => const LoginScreen(),
};
