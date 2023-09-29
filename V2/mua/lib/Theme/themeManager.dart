import 'package:flutter/material.dart';
import 'package:mua/Theme/themeConstants.dart';

class ThemeManager with ChangeNotifier {
  ThemeData _currentTheme = lightTheme; // default theme

  ThemeData get currentTheme => _currentTheme;

  void switchTheme(ThemeData theme) {
    _currentTheme = theme;
    notifyListeners();
  }
}
