import 'package:flutter/material.dart';
import 'package:tec/res/colors.dart';

// ******** custom TabBar widget ********
class CustomTabBarWidget extends StatelessWidget {
  final double tabBarHeight;
  final Color tabBarColor;
  final Color indicatorColor;
  final Color selectedItemColor;
  final Color unSelectedItemColor;
  final List<Widget> items;
  final bool isBottom;
  final TabController tabController;
  final Function(int)? onTap;

  const CustomTabBarWidget({
    Key? key,
    this.tabBarHeight = 50,
    this.tabBarColor = MyColors.customTabBarBackgroundColor,
    this.indicatorColor = Colors.black,
    this.selectedItemColor = Colors.black,
    this.unSelectedItemColor = Colors.black12,
    required this.items,
    required this.isBottom,
    required this.tabController,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: isBottom ? 0 : null,
      right: 0,
      left: 0,
      top: !isBottom ? 0 : null,
      child: Container(
        color: tabBarColor,
        height: tabBarHeight,
        width: double.infinity,
        child: TabBar(
          onTap: onTap,
          controller: tabController,
          tabs: items,
          unselectedLabelColor: unSelectedItemColor,
          labelColor: selectedItemColor,
          indicator: !isBottom
              ? UnderlineTabIndicator(
                  insets: const EdgeInsets.symmetric(horizontal: 2),
                  borderSide: BorderSide(color: indicatorColor),
                )
              : null,
          indicatorColor: isBottom ? Colors.transparent : indicatorColor,
        ),
      ),
    );
  }
}
