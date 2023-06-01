// ******** custom TabBar widget ********
import 'package:flutter/material.dart';

class CustomTabBarWidget extends StatelessWidget {
  final double tabBarHeight;
  final List<CustomTabBarItem> items;
  final Color tabBarColor;
  final bool isBottom;
  final Color dividerColor;

  const CustomTabBarWidget(
      {Key? key,
      this.tabBarHeight = 55,
      required this.items,
      this.tabBarColor = Colors.white,
      required this.isBottom,
      this.dividerColor = Colors.black12})
      : super(key: key);

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
          child: Column(
            children: [
              Expanded(child: Row(children: items)),
              !isBottom
                  ? Divider(
                      height: 2,
                      color: dividerColor,
                      thickness: 4,
                    )
                  : const SizedBox()
            ],
          ),
        ));
  }
}
// ******** custom TabBar Item widget ********

class CustomTabBarItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function()? onTap;
  final bool showSelectedItemUnderLine;

  const CustomTabBarItem.bottom(
      {required this.title, required this.isSelected, this.onTap, Key? key})
      : showSelectedItemUnderLine = false,
        super(key: key);

  const CustomTabBarItem.top(
      {required this.title, required this.isSelected, this.onTap, Key? key})
      : showSelectedItemUnderLine = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: (showSelectedItemUnderLine && isSelected)
            ? const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 2, color: Colors.black)))
            : null,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              title,
              style:
                  TextStyle(color: !isSelected ? Colors.black26 : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
