import 'package:flutter/material.dart';
import 'package:tec/res/colors.dart';

// ******** custom TabBar widget ********
class CustomTabBarWidget extends StatelessWidget {
  final double tabBarHeight;
  final List<CustomTabBarItem> items;
  final Color tabBarColor;
  final bool isBottom;
  final Color dividerColor;

  const CustomTabBarWidget(
      {Key? key,
      this.tabBarHeight = 50,
      required this.items,
      this.tabBarColor = MyColors.customTabBarBackgroundColor,
      required this.isBottom,
      this.dividerColor = MyColors.dividerColor,})
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
                      height: 1,
                      color: dividerColor,
                      thickness: 2,
                    )
                  : const SizedBox()
            ],
          ),
        ),);
  }
}

// ******** custom TabBar Item widget ********
class CustomTabBarItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function()? onTap;
  final bool showSelectedItemUnderLine;
  final TextStyle selectedTextStyle;
  final TextStyle? unSelectedTextStyle;

  static const defaultSelectedTextStyle = TextStyle(color: Colors.black);
  static const defaultUnSelectedTextStyle = TextStyle(color: Colors.black12);

  const CustomTabBarItem.bottom({
    required this.title,
    required this.isSelected,
    this.onTap,
    this.unSelectedTextStyle = defaultUnSelectedTextStyle,
    this.selectedTextStyle = defaultSelectedTextStyle,
    Key? key,
  })  : showSelectedItemUnderLine = false,
        super(key: key);

  const CustomTabBarItem.top({
    required this.title,
    required this.isSelected,
    this.onTap,
    this.unSelectedTextStyle = defaultUnSelectedTextStyle,
    this.selectedTextStyle = defaultSelectedTextStyle,
    Key? key,
  })  : showSelectedItemUnderLine = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // selectedTextStyle??TextStyle();
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: (showSelectedItemUnderLine && isSelected)
            ? const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.black)),)
            : null,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              title,
              style: !isSelected ? unSelectedTextStyle : selectedTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
