import 'package:flutter/material.dart';

import 'package:whatsapp_ui/src/themes/colors.dart';

class CustomTheme {
  static final lightTheme = ThemeData(
    primarySwatch: WhatsApp.mainLightColor,
    backgroundColor: const Color(0xFF00d369),
    indicatorColor: const Color(0xFFfdfffe),
    disabledColor: const Color(0xFFb1dad1),
    scaffoldBackgroundColor: const Color(0xFFfdfffd),
    textTheme: const TextTheme(
      headline1: TextStyle(color: Color(0xFFfdfffe), fontWeight: FontWeight.w500, fontSize: 23),
      headline4: TextStyle(color: Color(0xFF484848), fontWeight: FontWeight.w500, fontSize: 17),
      bodyText1: TextStyle(color: Color(0xFF484848), fontWeight: FontWeight.w400, fontSize: 15),
      bodyText2: TextStyle(color: Color(0xFF484848), fontWeight: FontWeight.w300, fontSize: 13),
    ),
    iconTheme: const IconThemeData(color: Color(0xFFfdfffe)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF00a781),
    ),
  );

  static final darkTheme = ThemeData(
    primarySwatch: WhatsApp.mainDarkColor,
    backgroundColor: const Color(0xFF00a781),
    indicatorColor: const Color(0xFF00a780),
    disabledColor: const Color(0xFF84979e),
    scaffoldBackgroundColor: const Color(0xFF0f1c1e),
    textTheme: const TextTheme(
      headline1: TextStyle(color: Color(0xFF84979e), fontWeight: FontWeight.w500, fontSize: 23),
      headline4: TextStyle(color: Color(0xFFd8e0df), fontWeight: FontWeight.w500, fontSize: 17),
      bodyText1: TextStyle(color: Color(0xFF78878B), fontWeight: FontWeight.w400, fontSize: 15),
      bodyText2: TextStyle(color: Color(0xFF78878B), fontWeight: FontWeight.w300, fontSize: 13),
    ),
    iconTheme: const IconThemeData(color: Color(0xFF84979e)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF00a781),
    ),
  );
}
