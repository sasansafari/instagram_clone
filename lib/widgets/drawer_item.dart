import 'package:flutter/material.dart';
import 'package:tec/res/dimens.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key, required this.title, required this.icon})
      : super(key: key);
  String? title;
  var icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: icon,
          onPressed: () {},
        ),
        const SizedBox(
          width: Dimens.small,
        ),
        Text(title!)
      ],
    );
  }
}
