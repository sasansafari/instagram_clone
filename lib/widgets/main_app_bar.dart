import 'dart:developer';

import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../res/colors.dart';

void main(List<String> args) {
  runApp(MainAppbarhome());
}

class MainAppbarhome extends StatelessWidget {
  MainAppbarhome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: MainAppBar()),
    );
  }
}

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // get size from device
    final screenSize = MediaQuery.of(context).size;
    // if device screen larger 1200 isLargScreen is true else isLargScreen is false

    final isLargeScreen = screenSize.width > 1200;

    return Container(
      padding: EdgeInsets.all(isLargeScreen ? 4 : 2),
      height: preferredSize.height,
      color: MyColors.bottomNavigationBar,
      child: Stack(children: [
        GestureDetector(
            onTap: () {
              log("Go To Home");
            },
            child: Center(child: Assets.icons.instagramLogo.svg())),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderBtn(
              badge: true,
              press: () {
                log("Go To Camera");
              },
              icon: Assets.icons.camera.svg(),
            ),
            Spacer(),
            HeaderBtn(
              badge: false,
              press: () {
                log("Go To IGTV");
              },
              icon: Assets.icons.igtv.svg(),
            ),
            HeaderBtn(
              badge: false,
              press: () {
                log("Go To Massenger");
              },
              icon: Assets.icons.messanger.svg(),
            ),
          ],
        ),
      ]),
    );
  }
}

class HeaderBtn extends StatelessWidget {
  HeaderBtn({
    Key? key,
    this.press,
    required this.badge,
    required this.icon,
  }) : super(key: key);

  final Function? press;

  final Widget icon;
  bool badge = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Stack(children: [
        icon,
        Positioned(
            top: 0,
            right: 0,
            child: badge
                ? Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  )
                : Container())
      ]),
      onPressed: press as void Function()?,
    );
  }
}
