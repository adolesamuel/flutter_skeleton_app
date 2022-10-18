import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    //TODO: Update colors to suite right app
    scaffoldBackgroundColor: Colors.blue,
    primarySwatch: const MaterialColor(
      0xFFFF1B03,
      {
        50: Color.fromRGBO(255, 27, 3, .1),
        100: Color.fromRGBO(255, 27, 3, .2),
        200: Color.fromRGBO(255, 27, 3, .3),
        300: Color.fromRGBO(255, 27, 3, .4),
        400: Color.fromRGBO(255, 27, 3, .5),
        500: Color.fromRGBO(255, 27, 3, .6),
        600: Color.fromRGBO(255, 27, 3, .7),
        700: Color.fromRGBO(255, 27, 3, .8),
        800: Color.fromRGBO(255, 27, 3, .9),
        900: Color.fromRGBO(255, 27, 3, 1),
      },
    ),
    primaryColor: Colors.red,
    iconTheme: const IconThemeData(color: Colors.black, size: 24),
    backgroundColor: Colors.white,
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
    }),
    textTheme: const TextTheme(
        headline1: TextStyle(
          fontFamily: "Mulish",
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
        headline2: TextStyle(
          fontFamily: "Mulish",
          fontSize: 17,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
        bodyText1: TextStyle(
          fontFamily: "Mulish",
          fontSize: 15,
          color: Colors.black,
        ),
        bodyText2: TextStyle(
          fontFamily: "Mulish",
          fontSize: 12,
          color: Colors.black,
        ),
        headline3: TextStyle(
          fontFamily: "Mulish",
          fontSize: 20,
          color: Colors.black,
        )),
    appBarTheme: const AppBarTheme(
      //Same appbar colors ensures consistency
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: Colors.black,
    ),
  );
}
