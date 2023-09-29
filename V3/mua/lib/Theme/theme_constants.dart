import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF222831),
    shadowColor: const Color(0xFFBBBFCA),
    highlightColor: const Color(0xFFF4F4F2),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Color(0xFF222831),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Color(0xFF222831),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ));

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
