import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import '../helpers/constants.dart';

ThemeData darkMode = ThemeData(
  scaffoldBackgroundColor: HexColor('333739'),
  iconTheme: const IconThemeData(color: Colors.black54),
  inputDecorationTheme: const InputDecorationTheme(
    //  fillColor: Colors.white,
    // filled: true,
    labelStyle: TextStyle(color: Colors.grey),
    hintStyle: TextStyle(color: Colors.white),

    //hintStyle: TextStyle(color: Colors.grey),
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: HexColor('333739'),
  ),
  primarySwatch: defaultColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: defaultColor),
  primaryColor: defaultColor,

  cardTheme: CardTheme(
    color: HexColor('#525252'),
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: const TextStyle(
      color: Colors.white,
    ),
    backgroundColor: HexColor('#525252'),
    elevation: 20,
    iconTheme: const IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: HexColor('333739'),
    ),
    // textTheme: TextTheme (
    //   bodyText1: TextStyle(
    //     fontSize: 20,
    //     fontWeight: FontWeight.w600,
    //     color: Colors.white,
    //     //fontFamily:
    //   ),
    // ),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline4: TextStyle(
      // fontSize: 25.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    caption: TextStyle(
      // fontSize: 17.0,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    ),
  ),
);

ThemeData lightMode = ThemeData(
  primarySwatch: defaultColor,
  primaryColor: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: defaultColor),
  // bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //   type: BottomNavigationBarType.fixed,
  //   backgroundColor: defaultColor,
  //   selectedItemColor: defaultColor,
  // ),
  iconTheme: IconThemeData(color: Colors.grey[400]),
  drawerTheme: const DrawerThemeData(),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.green,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: defaultColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
    ),
  ),

  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 17.0,
      color: Colors.black,
    ),
    headline4: TextStyle(
      // fontSize: 25.0,
      fontWeight: FontWeight.bold,
      color: Colors.black54,
    ),
  ),
);