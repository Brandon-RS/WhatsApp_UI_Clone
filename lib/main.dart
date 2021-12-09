import 'package:flutter/material.dart';

import 'package:whatsapp_ui/src/routes/routes.dart';
import 'package:whatsapp_ui/src/themes/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp UI Clone',
      themeMode: ThemeMode.system,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      initialRoute: HomePage.routeName,
      routes: getAplicationRoutes(),
      debugShowCheckedModeBanner: false,
    );
  }
}
