import 'package:flutter/material.dart';

// !Imports

import 'package:whatsapp_ui/src/pages/home_page.dart';
import 'package:whatsapp_ui/src/pages/chat_page.dart';

// !Exports

export 'package:whatsapp_ui/src/pages/home_page.dart';
export 'package:whatsapp_ui/src/pages/chat_page.dart';

// !Content

Map<String, WidgetBuilder> getAplicationRoutes() => <String, WidgetBuilder>{
      HomePage.routeName: (BuildContext context) => const HomePage(),
      ChatPage.routeName: (BuildContext context) => const ChatPage(),
    };
