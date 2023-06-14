import 'package:flutter/material.dart';

class NotificationTextStyle {
  NotificationTextStyle._();
  static TextStyle textStylee(
      {double fontSize = 13,
      Color color = Colors.black,
      FontWeight fontWeight = FontWeight.normal}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }
}
