import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static final main = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    textTheme: GoogleFonts.montserratTextTheme(
      const TextTheme(
        bodyText1: TextStyle(color: Colors.white, fontSize: 32),
        bodyText2: TextStyle(color: Colors.white, fontSize: 24),
      ),
    ),
  );
  static const linkText =
      TextStyle(color: Color.fromARGB(255, 78, 168, 241), fontSize: 24);
}
