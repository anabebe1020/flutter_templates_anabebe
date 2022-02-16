import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blueGrey,
    textTheme: GoogleFonts.montserratTextTheme(
      const TextTheme(
        bodyText1: TextStyle(color: Colors.black54, fontSize: 32),
        bodyText2: TextStyle(color: Colors.black54, fontSize: 24),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black54),
  );
  static final dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    textTheme: GoogleFonts.montserratTextTheme(
      const TextTheme(
        bodyText1: TextStyle(color: Colors.white, fontSize: 32),
        bodyText2: TextStyle(color: Colors.white, fontSize: 24),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white54),
  );
  static const linkText =
      TextStyle(color: Color.fromARGB(255, 78, 168, 241), fontSize: 24);
}
