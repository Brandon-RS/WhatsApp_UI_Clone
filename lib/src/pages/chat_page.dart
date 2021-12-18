import 'package:flutter/material.dart';

import 'package:whatsapp_ui/src/data/content.dart';
import 'package:whatsapp_ui/src/themes/colors.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  static const String routeName = 'chat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ArchivedWidget(),
          Expanded(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: const AllChats(),
            ),
          ),
        ],
      ),
    );
  }
}

class AllChats extends StatelessWidget {
  const AllChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;

    return ListView.builder(
      padding: const EdgeInsets.only(top: 20),
      itemCount: chats.length,
      itemBuilder: (_, int index) {
        return ListTile(
          contentPadding: const EdgeInsets.only(bottom: 10, left: 20, right: 16),
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: 55,
            height: 55,
            child: Image(
              image: NetworkImage(chats[index]['img'].length > 4 ? chats[index]['img'] : defaultImage),
              fit: BoxFit.cover,
            ),
          ),
          title: Text(chats[index]['name'], style: Theme.of(context).textTheme.headline4),
          subtitle: RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.done_all,
                    color: const Color(0xFF84979e),
                    size: chats[index]['cant'] == 0 && !chats[index]['sms'].contains('user:') ? 20 : 0,
                  ),
                ),
                const WidgetSpan(child: SizedBox(width: 5)),
                TextSpan(text: chats[index]['sms'], style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '10:33 AM',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(height: 8),
              CircleAvatar(
                radius: chats[index]['cant'] > 0 ? 10 : 0,
                child: Text(
                  '${chats[index]['cant']}',
                  style: TextStyle(
                    color: brightness == Brightness.light ? const Color(0xFFfdfffe) : const Color(0xFF0f1c1e),
                    fontSize: 12,
                  ),
                ),
                backgroundColor: Theme.of(context).backgroundColor,
              ),
            ],
          ),
        );
      },
    );
  }
}

class ArchivedWidget extends StatelessWidget {
  const ArchivedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final Color light = WhatsApp.mainDarkColor[500] as Color;
    final Color dark = Theme.of(context).disabledColor;

    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 20, top: 20),
      child: Row(
        children: [
          Icon(
            Icons.archive_outlined,
            color: brightness == Brightness.dark ? dark : light,
          ),
          const SizedBox(width: 20),
          Text(
            'Archived',
            style: Theme.of(context).textTheme.headline4,
          ),
          const Expanded(child: SizedBox(width: 10)),
          Text(
            '1',
            style: TextStyle(color: Theme.of(context).backgroundColor),
          ),
        ],
      ),
    );
  }
}
