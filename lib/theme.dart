import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final buttonFont = GoogleFonts.inter;

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Colors.grey.shade100,
    secondary: Colors.grey.shade200, 
  ),
  textTheme: TextTheme(
    labelLarge: buttonFont(
      color: Colors.black,
    )
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
  ),
  textTheme: TextTheme(
    labelLarge: buttonFont(
      color: Colors.white,
    )
  ),
);