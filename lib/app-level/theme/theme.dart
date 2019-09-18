import 'package:flutter/material.dart';
import 'package:flutter_contacts/app-level/utilities/constants.dart';

///App Theme...

ThemeData appThemeData() {
  //begin..

  return ThemeData(
    // Define the default font family.

    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue,
    ),
    primaryColor: Colors.blue,

    //Text themes....
    textTheme: TextTheme(
      headline: TextStyle(
        color: Color(0xFFF8AF28),
        fontWeight: FontWeight.w700,
        fontSize: 24.0,
        letterSpacing: 0.3,
      ),
      title: TextStyle(
        color: Color(0xFFF8AF28),
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
      body1: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w600,
        fontSize: 22.0,
        letterSpacing: 0.3,
      ),
      body2: TextStyle(
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
      ),
      button: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22.0,
        letterSpacing: -1.0,
      ),
      display1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22.0,
        letterSpacing: -1.0,
      ),
    ),
    //Card themes....

    cardTheme: CardTheme(
      color: Colors.grey.withOpacity(0.3),
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
    ),

    fontFamily: kFontFamilyMontserrat,
  );
}
