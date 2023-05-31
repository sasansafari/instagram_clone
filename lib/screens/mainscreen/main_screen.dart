import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:tec/gen/assets.gen.dart';
import 'package:tec/res/colors.dart';
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
  final List<int> _backFollowing = [0];

  final GlobalKey<NavigatorState> _homeScreenKey = GlobalKey();
  final GlobalKey<NavigatorState> _explorScreenKey = GlobalKey();
  final GlobalKey<NavigatorState> _notifiyScreenKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileScreenKey = GlobalKey();

  Future<bool> _onWillPop() async {
    if (_homeScreenKey.currentState!.canPop()) {
      _homeScreenKey.currentState!.pop();
    }

    log("back");
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: myAppbar(context),
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
              // Positioned(top: 0, left: 0, right: 0, child: headNav(context)),
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
              onTap: () =>
                  btmNavOnPresses(bottomNavIndex: BottomNavIndex.homeIndex),
              active: Assets.icons.homeSelected.svg(),
              inActive: Assets.icons.home.svg(),
              isSelected: selectedIndex == BottomNavIndex.homeIndex),
          BtmNavItem(
              onTap: () =>
                  btmNavOnPresses(bottomNavIndex: BottomNavIndex.explorIndex),
              active: Assets.icons.exploreSelected.svg(),
              inActive: Assets.icons.explore.svg(),
              isSelected: selectedIndex == BottomNavIndex.explorIndex),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, Screens.addNew),
              icon: Assets.icons.addNew.svg()),
          IconButton(
              onPressed: (() =>
                  setState(() => selectedIndex = BottomNavIndex.notifyIndex)),
              icon: selectedIndex == BottomNavIndex.notifyIndex
                  ? Assets.icons.notifySelected.svg()
                  : Assets.icons.notify.svg()),
          IconButton(
              onPressed: (() => setState(
                  () => selectedIndex = BottomNavIndex.userProfileIndex)),
              icon: selectedIndex == BottomNavIndex.userProfileIndex
                  ? const Icon(Icons.verified_user_sharp)
                  : const Icon(Icons.verified_user_outlined)),
        ],
      ),
    );
  }

  PreferredSize myAppbar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: MyColors.bottomNavigationBar,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Assets.icons.camera.svg(),
        ),
        leadingWidth: 32,
        title: Assets.icons.instagramLogo.svg(),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Assets.icons.igtv.svg(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Assets.icons.messanger.svg(),
          ),
        ],
      ),
    );
  }

  btmNavOnPresses({required bottomNavIndex}) {
    _backFollowing.remove(selectedIndex);

    if (_backFollowing.last != selectedIndex) {
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
