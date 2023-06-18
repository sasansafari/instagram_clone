import 'package:flutter/material.dart';
import 'package:tec/res/colors.dart';

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

  //* Regular TextStyle User Profile Screen = UPS
  static TextStyle getRegularTextStyleUPS() {
    return _getTextStyle(
      14.0,
      FontWeightManager.regular,
      MyColors.textPrimaryColor,
    );
  }

  //* Semi Regular TextStyle User Profile Screen UPS
  static TextStyle getSemiRegularTextStyleUPS() {
    return _getTextStyle(
      12.0,
      FontWeightManager.regular,
      MyColors.textPrimaryColor,
    );
  }

  //* Clickable Semi Regular TextStyle User Profile Screen  = UPS
  static TextStyle getClickableTextStyleUPS() {
    return _getTextStyle(
      12.0,
      FontWeightManager.regular,
      MyColors.textPrimaryColor,
    );
  }

  //* Bold TextStyle User Profile Screen = UPS
  static TextStyle getBoldTextStyleUPS() {
    return _getTextStyle(
      16.0,
      FontWeightManager.bold,
      MyColors.textPrimaryColor,
    );
  }

  //* Semi Bold TextStyle User Profile Screen = UPS
  static TextStyle getSemiBoldTextStyleUPS() {
    return _getTextStyle(
      12.0,
      FontWeightManager.bold,
      MyColors.textPrimaryColor,
    );
  }
}

