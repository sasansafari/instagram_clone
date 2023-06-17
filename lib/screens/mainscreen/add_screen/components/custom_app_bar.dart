import 'package:flutter/material.dart';
// ******** create custom AppBar ********

class CustomAddImageAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final double appBarHeight;
  final double appBarPadding;
  final String title;
  final Widget? backButton;
  final Widget? nextButton;
  final Color appBarColor;

  const CustomAddImageAppBarWidget({
    Key? key,
    this.appBarHeight = 50,
    required this.title,
    this.backButton,
    required this.nextButton,
    required this.appBarPadding,
    required this.appBarColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: appBarColor,
        padding: EdgeInsets.all(appBarPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            backButton ?? const SizedBox(),
            Align(
              alignment: Alignment.center,
              child: Row(
                children: [Text(title), const Icon(Icons.expand_more)],
              ),
            ),
            nextButton ?? const SizedBox()
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
