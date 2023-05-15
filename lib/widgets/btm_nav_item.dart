
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BtmNavItem extends StatelessWidget {
  void Function() onTap;
  var active;
  var inActive;
  bool isSelected;

  BtmNavItem({Key? key, 
    required this.onTap,
    required this.active,
    required this.inActive,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
              onPressed: onTap,
              icon:isSelected
                  ? active
                  : inActive);
  }
}