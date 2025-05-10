import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final buttonFont = GoogleFonts.inter;

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Color(0xFFe3e3e3),
    primary: Color(0xFFc9c9c9),
    secondary: Color(0xFFa3a3a3),
    tertiary: Color(0xFF4fa0ba), 
  ),
  textTheme: TextTheme(
    titleSmall: GoogleFonts.inter(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    labelLarge: buttonFont(
      color: Colors.black,
    )
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Color(0xFF1c1c1c),
    primary: Color(0xFF363636),
    secondary: Color(0xFF363636),
    tertiary: Color(0xFF4595b0),
  ),
  textTheme: TextTheme(
    titleSmall: GoogleFonts.inter(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    labelLarge: buttonFont(
      color: Colors.white,
    )
  ),
);