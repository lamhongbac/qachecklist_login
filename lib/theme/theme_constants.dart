import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorPrimary = Colors.deepOrangeAccent;
const colorAccent = Colors.orange;

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: colorPrimary,
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none),
      filled: true,
      fillColor: const Color.fromARGB(255, 89, 11, 120).withOpacity(0.1)),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     foregroundColor: const Color.fromARGB(255, 228, 19, 33),
  //     backgroundColor: const Color.fromARGB(255, 193, 206, 14),
  //   ),
  // ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // ... you can put more styling stuff here
      backgroundColor: Colors.white,
      foregroundColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
  textTheme: TextTheme(
    displayLarge: const TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.bold,
    ),
    // ···
    titleLarge: GoogleFonts.oswald(
      fontSize: 30,
      fontStyle: FontStyle.italic,
    ),
    bodyMedium: GoogleFonts.merriweather(
      fontSize: 20,
      color: Colors.red,
      fontStyle: FontStyle.italic,
    ),
    displaySmall: GoogleFonts.pacifico(),
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1)),
);
