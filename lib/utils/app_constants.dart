import 'package:flutter/material.dart';

import 'enums.dart';
class AppConstants {
  static final String appName = 'Vola';
  static double UI_PADDING = 20.0;

  static EdgeInsets appPadding = EdgeInsets.all(
      AppConstants.UI_PADDING,
  );

  static double UI_COMPONENT_PADDING = 15;

  static Gradient COMMON_UI_GRADIENT = const LinearGradient(
      colors: [
        Colors.white,
        Color(0xFFE1E1E1),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.11, 0.58]);

  static ThemeType selectedTheme = ThemeType.LIGHT;

  //Sort Type Id
  static const int kBestMatch = 0;
  static const int kBestRating = 1;
  static const int kPriceHighestFirst = 2;
  static const int kPriceLowestFirst = 3;

  static const int userTypeId = 1;
  static bool IS_LOGGED = false;
  static const int locationId = 1;
}