import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/res/colors.dart';
import 'package:tec/screens/mainscreen/explore_screen.dart';
import 'package:tec/screens/mainscreen/home_screen.dart';
import 'package:tec/screens/mainscreen/notrifications_screen.dart';
import 'package:tec/screens/mainscreen/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     
      bottomNavigationBar:Container(
        height: 60,
        width: double.infinity,
        color: MyColors.bottomNavigationBar,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: (() => setState(() => selectedIndex = BottomNavIndex.homeIndex)),
                icon: selectedIndex == BottomNavIndex.homeIndex
                    ? Assets.icons.homeSelected.svg()
                    : Assets.icons.home.svg()),
            IconButton(
                onPressed: (() => setState(() => selectedIndex = BottomNavIndex.explorIndex)),
                icon: selectedIndex == BottomNavIndex.explorIndex
                    ? Assets.icons.exploreSelected.svg()
                    : Assets.icons.explore.svg()),
            IconButton(
                onPressed:(){},
                icon: Assets.icons.addNew.svg()),
            IconButton(
                onPressed: (() => setState(() => selectedIndex = BottomNavIndex.notifyIndex)),
                icon: selectedIndex == BottomNavIndex.notifyIndex
                    ? Assets.icons.notifySelected.svg()
                    : Assets.icons.notify.svg()),
            IconButton(
                onPressed: (() => setState(() => selectedIndex = BottomNavIndex.userProfileIndex)),
                icon: selectedIndex == BottomNavIndex.userProfileIndex
                    ? const Icon(Icons.verified_user_sharp)
                    : const Icon(Icons.verified_user_outlined)),
          ],
        ),
      ),

      body:   SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: const [
              HomeScreen(),
              ExploreScreen(),
              NotificationsScreen(),
              UserProfileScreen()
          ],

        ),
      ),
    );
  }
}


class BottomNavIndex{
  BottomNavIndex._();
  static const int homeIndex = 0;
  static const int explorIndex = 1;
  static const int notifyIndex = 2;
  static const int userProfileIndex = 3;
}
