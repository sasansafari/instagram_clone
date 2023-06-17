import 'package:flutter/material.dart';

class ImageActionsCustomWidget extends StatelessWidget {
  final double width;
  final Widget child;
  final Function()? onTap;
  const ImageActionsCustomWidget(
      {Key? key, this.width = 31.5, required this.child, this.onTap,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 31.5,
        decoration: const BoxDecoration(
            color: Color.fromARGB(204, 38, 38, 38),
            borderRadius: BorderRadius.all(Radius.circular(30)),),
        child: child,
      ),
    );
  }
}
