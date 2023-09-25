import 'package:flutter/material.dart';

///Color Template
abstract class ColorTheme {
  ///Color darkOrange
  static const darkOrange = Color.fromRGBO(240, 83, 21, 1);

  ///Color Orange
  static const orange = Color.fromRGBO(240, 83, 21, 1);

  ///Color darkPurple
  static const darkPurple = Color.fromRGBO(20, 24, 35, 1);

  ///Color Grey
  static const gray = Color.fromRGBO(196, 197, 198, 1);

  ///Color White
  static const white = Color.fromRGBO(255, 255, 255, 1);

  ///Color White 70
  static const white_70 = Colors.white70;

  ///Color ThemeData
  static final ColorScheme colorScheme =
      ColorScheme.fromSeed(seedColor: Colors.deepPurple);
}
