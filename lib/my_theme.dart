import 'package:flutter/material.dart';

class MyTheme {
  static Color blackColor = Color(0xff242424);
  static Color whiteColor = Color(0xffF8F8F8);
  static Color primaryColor = Color(0xffB7935F);
  static Color primaryDarkColor = Color(0xff141A2E);
  static Color goldColor = Color(0xffFACC1D);
  static ThemeData light = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        color: blackColor,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        fontSize: 25,
        color: blackColor,
        fontWeight: FontWeight.w600,
      ),
      subtitle2: TextStyle(
        fontSize: 25,
        color: blackColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blackColor,
      unselectedItemColor: whiteColor,
      elevation: 0,
    ),
  );
  static ThemeData dark = ThemeData(
    primaryColor: primaryDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        color: whiteColor,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        fontSize: 25,
        color: whiteColor,
        fontWeight: FontWeight.w600,
      ),
      subtitle2: TextStyle(
        fontSize: 25,
        color: whiteColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: goldColor,
      unselectedItemColor: whiteColor,
      elevation: 0,
    ),
  );
}
