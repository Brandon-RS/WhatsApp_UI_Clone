import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_ui/src/pages/camera_page.dart';
import 'package:whatsapp_ui/src/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  bool aux = false;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    /* _tabController.addListener(() {
      if (_tabController.index == 0) {
        aux = false;
      } else {
        aux = true;
      }
      setState(() {});
    }); */

    super.initState();
  }

  getBarColor() {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      );
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (a) {
          if (a.metrics.axis == Axis.horizontal) {
            if (a.metrics.pixels < 200) {
              aux = true;
            } else {
              aux = false;
            }

            setState(() {});
          }
          return true;
        },
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => !aux
              ? [
                  SliverAppBar(
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Theme.of(context).colorScheme.primary,
                    ),
                    titleTextStyle: Theme.of(context).textTheme.headline1,
                    expandedHeight: 100,
                    title: const Text('WhatsApp UI'),
                    actions: [
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.more_vert,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        onPressed: () {},
                      ),
                    ],
                    pinned: true,
                    floating: true,
                    forceElevated: innerBoxIsScrolled,
                    bottom: TabBar(
                      isScrollable: true,
                      indicatorWeight: 3,
                      labelColor: Theme.of(context).indicatorColor,
                      labelStyle: const TextStyle(fontSize: 12.0),
                      unselectedLabelColor: Theme.of(context).disabledColor,
                      unselectedLabelStyle: const TextStyle(fontSize: 12.0),
                      controller: _tabController,
                      tabs: [
                        const Tab(icon: Icon(Icons.camera_alt_rounded), height: 38),
                        option('CHATS'),
                        option('STATUS'),
                        option('CALLS'),
                      ],
                    ),
                  ),
                ]
              : [],
          body: TabBarView(
            controller: _tabController,
            children: [
              const CameraPage(),
              const ChatPage(),
              Container(color: Colors.green),
              Container(color: Colors.black),
            ],
          ),
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Column(
              children: [
                CircleAvatar(
                  child: _tabController.index == 2
                      ? Icon(
                          Icons.edit,
                          color: brightness == Brightness.dark ? Colors.white70 : Colors.black54,
                        )
                      : Container(),
                  backgroundColor: brightness == Brightness.dark ? const Color(0xFF292929) : const Color(0xFFB4B4B4),
                  radius: _tabController.index == 2 ? 20.0 : 0.0,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  child: CircleAvatar(
                    child: Icon(getIcon(_tabController.index), color: Colors.white),
                    backgroundColor: Theme.of(context).backgroundColor,
                    radius: _tabController.index != 0 ? 25.0 : 0.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getIcon(int index) {
    IconData icon = Icons.insert_comment;

    if (index == 0) {
      return;
    } else if (index == 1) {
      icon = Icons.insert_comment;
    } else if (index == 2) {
      icon = Icons.camera_alt;
    } else if (index == 3) {
      icon = Icons.add_call;
    }

    return icon;
  }

  Widget option(String text) {
    return Tab(
      height: 38,
      child: Padding(
        child: Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      ),
    );
  }
}
