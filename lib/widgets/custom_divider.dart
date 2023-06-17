import 'package:flutter/material.dart';

import '../res/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: MyColors.dividers,
      height: .5,
    );
  }
}
