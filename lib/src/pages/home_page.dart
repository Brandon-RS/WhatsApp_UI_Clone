import 'package:flutter/material.dart';
import 'package:whatsapp_ui/src/themes/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: const Text('WhatsApp UI'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                isScrollable: true,
                indicatorWeight: 3,
                labelColor: Colors.white,
                labelStyle: const TextStyle(fontSize: 12.0),
                unselectedLabelColor: Palette.mainLightColor[50],
                unselectedLabelStyle: const TextStyle(fontSize: 12.0),
                controller: _tabController,
                tabs: [
                  const Icon(Icons.camera_alt_rounded),
                  option('CHATS'),
                  option('STATUS'),
                  option('CALLS'),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(color: Colors.red),
            Container(color: Colors.yellow),
            Container(color: Colors.green),
            Container(color: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget option(String text) {
    return Padding(
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    );
  }
}
