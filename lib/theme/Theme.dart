import 'package:flutter/material.dart';

class DangleTimeTheme {
  DangleTimeTheme._();

  static final ThemeData lightTheme = ThemeData(
    backgroundColor: Colors.white,
    primaryColor: Color(0xffFF3B30),
    scaffoldBackgroundColor: Color(0xffF7F7F7),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black87,
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.black54,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.black87,
      ),
      headline2: TextStyle(
        color: Colors.black87,
      ),
      headline3: TextStyle(
        color: Colors.black87,
      ),
      headline4: TextStyle(
        color: Colors.black87,
      ),
      headline5: TextStyle(
        color: Colors.black87,
      ),
      headline6: TextStyle(
        color: Color(0xffFF3B30),
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        color: Colors.black87,
        fontSize: 16,
      ),
      bodyText2: TextStyle(
        color: Colors.black87,
        fontSize: 12,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.black54,
      primaryVariant: Color(0xffF7F7F7),
      secondary: Color(0xff670101),
      onSecondary: Colors.white,
      onBackground: Colors.black,
    ).copyWith(secondary: Color(0xff670101)),
  );

  static final ThemeData darkTheme = ThemeData(
    backgroundColor: Color(0xff222222),
    primaryColor: Color(0xffFF3B30),
    scaffoldBackgroundColor: Color(0xff1A1A1A),
    appBarTheme: AppBarTheme(
      color: Color(0xff222222),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    cardTheme: CardTheme(
      color: Color(0xff1F1F1F),
    ),
    iconTheme: IconThemeData(
      color: Color.fromRGBO(255, 255, 255, 0.8),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white,
      ),
      headline2: TextStyle(
        color: Colors.white,
      ),
      headline3: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 0.8),
      ),
      headline4: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 0.8),
      ),
      headline5: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 0.8),
      ),
      headline6: TextStyle(
        color: Color(0xffFF3B30),
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      bodyText2: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 0.8),
        fontSize: 12,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Color(0xff1A1A1A),
      onPrimary: Color.fromRGBO(255, 255, 255, 0.75),
      primaryVariant: Color(0xff1D1D1D),
      secondary: Color(0xffFF3B30),
      onSecondary: Colors.white,
      onBackground: Colors.white,
    ).copyWith(secondary: Color(0xff670101)),
  );
}
