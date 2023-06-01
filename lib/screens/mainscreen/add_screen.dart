import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarWidget(context),
    );
  }

  CustomAddImageAppBarWidget _buildAppBarWidget(BuildContext context) {
    return CustomAddImageAppBarWidget(
        title: 'Recents',
        backButton: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        nextButton: GestureDetector(
          onTap: () {},
          child: const Text(
            'Next',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        appBarPadding: 14);
  }
}

// ******** create custom AppBar ********
class CustomAddImageAppBarWidget extends StatelessWidget
    with PreferredSizeWidget {
  final double appBarHeight;
  final double appBarPadding;
  final String title;
  final Widget? backButton;
  final Widget? nextButton;

  const CustomAddImageAppBarWidget(
      {Key? key,
      this.appBarHeight = 50,
      required this.title,
      this.backButton,
      required this.nextButton,
      required this.appBarPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
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
    ));
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
