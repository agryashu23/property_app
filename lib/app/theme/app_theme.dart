import 'package:flutter/material.dart';
import 'package:property_app/app/contants/app_colors.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,

    // textTheme: TextTheme().apply(
    //   fontFamily: 'Arial',
    //   bodyColor: Colors.black,
    //   displayColor: Colors.black,
    // ),
    // iconTheme: const IconThemeData(
    //   color: Colors.black,
    // ),
    appBarTheme: AppBarTheme(
        backgroundColor:  bgColorLight,
      titleTextStyle: TextStyle(color: Colors.black),
      iconTheme: IconThemeData(
        color: Colors.black
      )
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFB5EB49),
      secondary: Color(0xFF7AA721),
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,

    iconTheme: const IconThemeData(
      color: Colors.black,

    ),
    textTheme: TextTheme().apply(
      fontFamily: 'Arial',
      bodyColor: Colors.white,
      displayColor: Colors.white
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFB5EB49),
      secondary: Color(0xFF7AA721),
    ),
  );
}
