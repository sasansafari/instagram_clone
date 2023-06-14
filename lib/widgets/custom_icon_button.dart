import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final double width;
  final double height;
  final Function() onPressed;
  const CustomIconButton({
    required this.onPressed,
    required this.icon,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      constraints: BoxConstraints(
        maxWidth: width,
        maxHeight: height,
      ),
      padding: const EdgeInsets.all(0),
    );
  }
}
