import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ButtonFont = GoogleFonts.inter;

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade400,
    primary: Colors.grey.shade300,
    secondary: Colors.grey.shade200, 
  ),
  textTheme: TextTheme(
    labelLarge: ButtonFont(
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
    labelLarge: ButtonFont(
      color: Colors.white,
    )
  ),
);