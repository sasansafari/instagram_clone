import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/res/constant/colors.dart';
import 'package:tec/route/names.dart';
import 'package:tec/screens/mainscreen/explore_screen.dart';
import 'package:tec/screens/mainscreen/home_screen.dart';
import 'package:tec/screens/mainscreen/notrifications_screen.dart';
import 'package:tec/screens/mainscreen/user_profile_screen.dart';
import 'package:tec/widgets/btm_nav_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final GlobalKey<NavigatorState> _homeScreenKey = GlobalKey();
  final GlobalKey<NavigatorState> _explorScreenKey = GlobalKey();
  final GlobalKey<NavigatorState> _notifiyScreenKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileScreenKey = GlobalKey();

  final List<int> _backFollowing = [0, 1, 3];

  late final map = {
    BottomNavIndex.homeIndex: _homeScreenKey,
    BottomNavIndex.explorIndex: _explorScreenKey,
    BottomNavIndex.notifyIndex: _notifiyScreenKey,
    BottomNavIndex.userProfileIndex: _profileScreenKey,
  };

  Future<bool> _onWillPop() async {
    if (map[selectedIndex]!.currentState!.canPop()) {
      map[selectedIndex]!.currentState!.pop();
    } else if (_backFollowing.isNotEmpty) {
      setState(() {
        selectedIndex = _backFollowing.last;
        _backFollowing.removeLast();
      });

      return false;
    }

    log("back");
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 60,
                child: IndexedStack(
                  index: selectedIndex,
                  children: [
                    Navigator(
                      key: _homeScreenKey,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    ),
                    Navigator(
                      key: _explorScreenKey,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                          builder: (context) => ExploreScreen()),
                    ),
                    Navigator(
                      key: _notifiyScreenKey,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                          builder: (context) => const NotificationsScreen()),
                    ),
                    Navigator(
                      key: _profileScreenKey,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                          builder: (context) => const UserProfileScreen()),
                    ),
                  ],
                ),
              ),
              Positioned(bottom: 0, left: 0, right: 0, child: btmNav(context))
            ],
          ),
        ),
      ),
    );
  }

  Container btmNav(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: MyColors.bottomNavigationBar,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          BtmNavItem(
              onTap:()=> btmNavOnPresses(bottomNavIndex: BottomNavIndex.homeIndex),
              active: Assets.icons.homeSelected.svg(),
              inActive: Assets.icons.home.svg(),
              isSelected: selectedIndex == BottomNavIndex.homeIndex),
          BtmNavItem(
              onTap:()=> btmNavOnPresses(bottomNavIndex: BottomNavIndex.explorIndex),
              active: Assets.icons.exploreSelected.svg(),
              inActive: Assets.icons.explore.svg(),
              isSelected: selectedIndex == BottomNavIndex.explorIndex),

          IconButton(
              onPressed: () => Navigator.pushNamed(context, Screens.addNew),
              icon: Assets.icons.addNew.svg()),

          BtmNavItem(
              onTap: ()=>btmNavOnPresses(bottomNavIndex: BottomNavIndex.notifyIndex),
              active: Assets.icons.notifySelected.svg(),
              inActive: Assets.icons.notify.svg(),
              isSelected: selectedIndex == BottomNavIndex.notifyIndex),

          BtmNavItem(
              onTap:()=> btmNavOnPresses(bottomNavIndex: BottomNavIndex.userProfileIndex),
              active:const Icon(Icons.verified_user_sharp),
              inActive: const Icon(Icons.verified_user_outlined),
              isSelected: selectedIndex == BottomNavIndex.userProfileIndex),


 
        ],
      ),
    );
  }

  btmNavOnPresses({required bottomNavIndex }){
       _backFollowing.remove(selectedIndex);

       if (_backFollowing.last!=selectedIndex) {
         _backFollowing.add(selectedIndex);
       }

       setState(() => selectedIndex = bottomNavIndex);
  }

}

class BottomNavIndex {
  BottomNavIndex._();
  static const int homeIndex = 0;
  static const int explorIndex = 1;
  static const int notifyIndex = 2;
  static const int userProfileIndex = 3;
}
