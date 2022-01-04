import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerProviderMy extends ChangeNotifier {
  List<String> items = [
    "MESSAGES",
    "TRENDING",
    "BOOKMARKS",
    "GALLERY",
    "SETTINGS",
    "NOTIFICATIONS",
    "PEOPLE",
    "PLACES",
  ];
  List<IconData> itemIcons = [
    Icons.message_outlined,
    Icons.trending_up,
    Icons.bookmark_border_outlined,
    Icons.collections,
    Icons.settings_outlined,
    Icons.notifications_outlined,
    Icons.people_outline,
    Icons.location_on_outlined,
  ];
}
