import 'package:flutter/material.dart';

import 'package:whatsapp_ui/src/themes/colors.dart';

class CustomTheme {
  static final lightTheme = ThemeData(
    primarySwatch: WhatsApp.mainLightColor,
  );

  static final darkTheme = ThemeData(
    primarySwatch: WhatsApp.mainDarkColor,
  );
}
