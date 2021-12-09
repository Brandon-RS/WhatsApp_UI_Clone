import 'package:flutter/material.dart';

// !Imports

import 'package:whatsapp_ui/src/pages/home_page.dart';

// !Exports

export 'package:whatsapp_ui/src/pages/home_page.dart';

// !Content

Map<String, WidgetBuilder> getAplicationRoutes() => <String, WidgetBuilder>{
      HomePage.routeName: (BuildContext context) => const HomePage(),
    };
