import 'package:flutter/material.dart';
import 'package:watch_store/providers/color_schemes.dart';

class ColorSchemeProvider extends ChangeNotifier {
  ThemeData _selectedColorScheme = ColorSchemes.defaultTheme;

  ThemeData get selectedColorScheme => _selectedColorScheme;

  void changeColorScheme(ThemeData newColorScheme) {
    _selectedColorScheme = newColorScheme;
    notifyListeners();
  }
}
