import 'package:flutter/material.dart';

class CustomThemes {
  ThemeData light = ThemeData(
      fontFamily: 'MontSerrat',
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white);

  ThemeData dark = ThemeData(
    fontFamily: 'MontSerrat',
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
  );
}
