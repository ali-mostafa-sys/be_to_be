

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final primaryColor = HexColor('#286955');
final fillTextFormColor = HexColor("#DCDCDC");

final appTheme =ThemeData(

  fontFamily: 'OpenSans',
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,

  /// text form field theme
  inputDecorationTheme: InputDecorationTheme(



    fillColor: fillTextFormColor,

    filled: true,
    errorMaxLines: 3,
    labelStyle: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
    floatingLabelStyle: TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.bold,
    ),
    focusedBorder: OutlineInputBorder(

      borderSide: BorderSide(
          style: BorderStyle.solid,color: primaryColor,width: 1
      ),
      borderRadius: BorderRadius.circular(25),

    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(style: BorderStyle.solid,color: primaryColor,width: 1),
      borderRadius: BorderRadius.circular(25),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide:
      BorderSide(style: BorderStyle.solid, width: 1, color: Colors.red),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(style: BorderStyle.solid,color: primaryColor,width: 1),
      borderRadius: BorderRadius.circular(25),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(style: BorderStyle.solid,color: primaryColor,width: 1),
      borderRadius: BorderRadius.circular(25),
    ),
    prefixIconColor: primaryColor,
    suffixIconColor: primaryColor,
  ),

  /// here for BottomNavigationBar themeData
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor('#FFFFFF'),
    selectedItemColor: primaryColor,
    unselectedItemColor: HexColor("#8D8D8D"),
    elevation: 25,
    selectedLabelStyle: TextStyle(
      color: primaryColor
    ),
    unselectedLabelStyle: TextStyle(color:HexColor("#8D8D8D"), ),
    selectedIconTheme: IconThemeData(
      color: primaryColor
    ),
    unselectedIconTheme: IconThemeData(
      color: HexColor("#8D8D8D"),
    )
  ),


);