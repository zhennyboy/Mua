import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFFFF9696),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 26,
      fontFamily: 'Font',
      color: Color(0xFFFF9696),
    ),
    displayMedium: TextStyle(
      fontSize: 24,
      fontFamily: 'Font',
      color: Color(0xFFFF9696),
    ),
    displaySmall: TextStyle(
      fontSize: 16,
      fontFamily: 'Font',
      color: Color(0xFFFF9696),
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontFamily: 'Font',
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontFamily: 'Font',
      color: Colors.black,
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.teal,
);

final customTheme1 = ThemeData(
  primaryColor: Colors.purple,
);

final customTheme2 = ThemeData(
  primaryColor: Colors.orange,
);
