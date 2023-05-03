import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/res/colors.dart';
import 'package:tec/route/names.dart';
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

  final GlobalKey<NavigatorState> _homeScreenKey  = GlobalKey();
  final GlobalKey<NavigatorState> _explorScreenKey  = GlobalKey();
  final GlobalKey<NavigatorState> _notifiyScreenKey  = GlobalKey();
  final GlobalKey<NavigatorState> _profileScreenKey  = GlobalKey();

  late final map ={
    BottomNavIndex.homeIndex:_homeScreenKey,
    BottomNavIndex.explorIndex:_explorScreenKey,
    BottomNavIndex.notifyIndex:_notifiyScreenKey,
    BottomNavIndex.userProfileIndex:_profileScreenKey,
  };


  Future<bool> _onWillPop() async{
   
    if (map[selectedIndex]!.currentState!.canPop()) {
      map[selectedIndex]!.currentState!.pop();
    } 
 
    log("back");  
    return false;
  }

 
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: _onWillPop ,
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
                  children:  [
                    
                    Navigator(
                      key:_homeScreenKey ,
                      onGenerateRoute: (settings) =>
                          MaterialPageRoute(builder: (context) => const HomeScreen()),
                    ),
              
                    Navigator(
                      key: _explorScreenKey,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                          builder: (context) =>   ExploreScreen()),
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
    
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: btmNav(context))
            
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
              onPressed:()=>Navigator.pushNamed(context,Screens.addNew ),
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
