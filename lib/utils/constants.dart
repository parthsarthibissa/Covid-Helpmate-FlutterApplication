import 'package:flutter/material.dart';

class CustomThemes {
  ThemeData light = ThemeData(
      brightness: Brightness.light, scaffoldBackgroundColor: Colors.white);

  ThemeData dark = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
  );
}
