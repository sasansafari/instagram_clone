import 'package:flutter/material.dart';

abstract class FontWeightManager {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight bold = FontWeight.w600;
}

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

class MyStyles {
  MyStyles._();

  //* Regular Style
  static TextStyle getRegularStyle(
      {double fontSize = 13.0, required Color color}) {
    return _getTextStyle(
      fontSize,
      FontWeightManager.regular,
      color,
    );
  }

//* Bold Style
  static TextStyle getBoldStyle(
      {double fontSize = 13.0, required Color color}) {
    return _getTextStyle(
      fontSize,
      FontWeightManager.bold,
      color,
    );
  }
}
