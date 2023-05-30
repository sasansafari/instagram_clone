
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BtmNavItem extends StatefulWidget {
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
  State<BtmNavItem> createState() => _BtmNavItemState();
}

class _BtmNavItemState extends State<BtmNavItem> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
              onPressed: widget.onTap,
              icon:widget.isSelected
                  ? widget.active
                  : widget.inActive);
  }
}