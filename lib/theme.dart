import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


ThemeData lightMode = ThemeData(
  splashColor: Colors.transparent,
  splashFactory: NoSplash.splashFactory,
  highlightColor: Colors.transparent,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Color(0xFFe3e3e3),
    primary: Color(0xFFc9c9c9),
    secondary: Color(0xFFa3a3a3),
    tertiary: Color(0xFFD3D3D3), 
  ),
  textTheme: TextTheme(
    titleSmall: GoogleFonts.roboto(
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: GoogleFonts.roboto(
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: GoogleFonts.inter(
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: GoogleFonts.roboto(
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    labelLarge: GoogleFonts.roboto(
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: GoogleFonts.inter(
      color: Colors.black
    )
  ),
);

ThemeData darkMode = ThemeData(
  splashColor: Colors.transparent,
  splashFactory: NoSplash.splashFactory,
  highlightColor: Colors.transparent,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Color(0xFF1A2526),
    primary: Color(0xFF363636),
    secondary: Color(0xFF5c5c5c),
    tertiary: Color(0xFF4595b0),
  ),
  textTheme: TextTheme(
    titleSmall: GoogleFonts.roboto(
      color: Colors.white,
      fontWeight: FontWeight.normal,
    ),
    titleMedium: GoogleFonts.roboto(
      color: Colors.white,
      fontWeight: FontWeight.normal,
    ),
    titleLarge: GoogleFonts.roboto(
      color: Colors.white,
      fontWeight: FontWeight.normal,
    ),
    labelLarge: GoogleFonts.roboto(
      color: Colors.white
    ),
    bodyMedium: GoogleFonts.inter(
      color: Colors.white
    ),
    bodySmall: GoogleFonts.inter(
      color: Colors.white
    )
  ),
);