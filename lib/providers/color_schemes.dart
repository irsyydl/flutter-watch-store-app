import 'package:flutter/material.dart';

class ColorSchemes {
  static final defaultTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.green),
  );

  static final midnightDark = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(secondary: Colors.orange),
  );

  static final greenApple = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(secondary: Colors.red),
  );

  static final oceanBlue = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.blueAccent),
  );
}
