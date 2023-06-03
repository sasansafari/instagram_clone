import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';

import '../../route/names.dart';
import 'explore_screen.dart';
import 'home_screen.dart';
import 'notrifications_screen.dart';
import 'user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final GlobalKey<NavigatorState> _homeScreenKey = GlobalKey();
  final GlobalKey<NavigatorState> _exploreScreenKey = GlobalKey();
  final GlobalKey<NavigatorState> _notifyScreenKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileScreenKey = GlobalKey();

  late final navigationMapper = {
    BottomNavIndex.homeIndex: _homeScreenKey,
    BottomNavIndex.exploreIndex: _exploreScreenKey,
    BottomNavIndex.notifyIndex: _notifyScreenKey,
    BottomNavIndex.profileIndex: _profileScreenKey,
  };

  List<int> navigationHistory = [
    0,
  ];

  Future<bool> _onWillPop() async {
    if (navigationMapper[selectedIndex]!.currentState!.canPop()) {
      navigationMapper[selectedIndex]!.currentState!.pop();
    } else if (navigationHistory.length > 1) {
      setState(() {
        navigationHistory.remove(navigationHistory.last);
        selectedIndex = navigationHistory.last;
      });
    } else if (navigationHistory.length == 1) {
      setState(() {
        selectedIndex = navigationHistory.first;
      });
    }
    log('Pressed back');
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
              bottom: 60,
              top: 0,
              right: 0,
              left: 0,
              child: IndexedStack(
                index: selectedIndex,
                children: [
                  Navigator(
                    key: _homeScreenKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  ),
                  Navigator(
                    key: _exploreScreenKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
 
                      builder: (context) =>  ExploreScreen(),
 
                    ),
                  ),
                  Navigator(
                    key: _notifyScreenKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ),
                  ),
                  Navigator(
                    key: _profileScreenKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const UserProfileScreen(),
                    ),
                  ),
                ],
              ),
            ),
            navigationBottom(context),
          ],
        )),
      ),
    );
  }

  Positioned navigationBottom(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: SizedBox(
          height: 60,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: (() => setState(
                      () => selectedIndex = BottomNavIndex.homeIndex,
                    )),
                icon: selectedIndex == BottomNavIndex.homeIndex
                    ? Assets.icons.homeSelected.svg()
                    : Assets.icons.home.svg(),
              ),
              IconButton(
                onPressed: (() => setState(
                      () => [
                        selectedIndex = BottomNavIndex.exploreIndex,
                        if (!navigationHistory
                            .contains(BottomNavIndex.exploreIndex))
                          {
                            navigationHistory.add(BottomNavIndex.exploreIndex),
                          }
                      ],
                    )),
                icon: selectedIndex == BottomNavIndex.exploreIndex
                    ? Assets.icons.exploreSelected.svg()
                    : Assets.icons.explore.svg(),
              ),
              IconButton(
                onPressed: () => Navigator.pushNamed(context, Screens.addNew),
                icon: Assets.icons.addNew.svg(),
              ),
              IconButton(
                  onPressed: (() => setState(
                        () => [
                          selectedIndex = BottomNavIndex.notifyIndex,
                          if (!navigationHistory
                              .contains(BottomNavIndex.notifyIndex))
                            {
                              navigationHistory.add(BottomNavIndex.notifyIndex),
                            }
                        ],
                      )),
                  icon: selectedIndex == BottomNavIndex.notifyIndex
                      ? Assets.icons.notifySelected.svg()
                      : Assets.icons.notify.svg()),
              IconButton(
                onPressed: (() => setState(
                      () => [
                        selectedIndex = BottomNavIndex.profileIndex,
                        if (!navigationHistory
                            .contains(BottomNavIndex.profileIndex))
                          {
                            navigationHistory.add(BottomNavIndex.profileIndex),
                          }
                      ],
                    )),
                icon: selectedIndex == BottomNavIndex.profileIndex
                    ? const Icon(Icons.supervised_user_circle_rounded)
                    : const Icon(Icons.data_usage_rounded),
              ),
            ],
          ),
        ));
  }
}

class BottomNavIndex {
  BottomNavIndex._();

  static const int homeIndex = 0;
  static const int exploreIndex = 1;
  static const int notifyIndex = 2;
  static const int profileIndex = 3;
}
