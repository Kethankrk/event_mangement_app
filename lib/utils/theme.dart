import 'package:flutter/material.dart';

final baseTheme = ThemeData(
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      height: 1.0,
    ),
    titleMedium: TextStyle(
      fontSize: 38,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      height: 1.0,
    ),
    titleSmall: TextStyle(
        fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.w400),
    labelSmall: TextStyle(fontSize: 16, color: Color.fromARGB(255, 97, 97, 97)),
    displaySmall: TextStyle(fontSize: 16, color: Colors.white),
  ),
);

const hyperLinkTextTheme = TextStyle(
  color: Colors.blue,
  decoration: TextDecoration.underline,
  decorationColor: Colors.blue,
);
