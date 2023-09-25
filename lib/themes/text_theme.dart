import 'package:flutter/material.dart';
import 'package:solid_software_test/themes/color_theme.dart';

///Text Template
abstract class Fonts {
  /// Main Text
  static const mainText = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: ColorTheme.gray,
  );

  /// Text for App Bar
  static const appBar = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: ColorTheme.darkOrange,
  );

  /// Text for button
  static const button = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: ColorTheme.white,
  );

  /// Main Bonus Screen Text
  static const bonusScreenText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: ColorTheme.white,
  );

  /// Main Bonus Button Text
  static const bonusButtons = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: ColorTheme.white,
  );
}
