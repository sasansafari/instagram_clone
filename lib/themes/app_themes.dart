import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tec/res/constant/colors.dart';
import 'package:tec/res/constant/dimens.dart';




class AppThemes {
  static ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontFamily: 'dana',
          fontSize: MyDimens.num16,
          fontWeight: FontWeight.w700,
          color: MyColors.textPrimaryColor),
      displayMedium: TextStyle(
          fontFamily: 'dana',
          fontSize: MyDimens.num14,
          color: MyColors.textPrimaryColor,
          fontWeight: FontWeight.w700),
      displaySmall: TextStyle(
          fontFamily: 'dana',
          fontSize: MyDimens.num14,
          color: MyColors.textPrimaryColor,
          fontWeight: FontWeight.w300),
      labelMedium: TextStyle(
          fontFamily: 'dana',
          fontSize: MyDimens.num14,
          color: MyColors.textSecondaryColor,
          fontWeight: FontWeight.w300),
    ),
  );
}