import 'dart:ui';

import 'package:atro/consts/Colors/colors.dart';
import 'package:atro/consts/SizeConfig/size_config.dart';
import 'package:atro/consts/Styles/hint_style.dart';
import 'package:atro/consts/readyWidgets/circle_avatar_with_badge.dart';
import 'package:atro/provider/drawer_provider.dart';
import 'package:atro/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerMy extends StatelessWidget {
  const DrawerMy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      child: Ink(
        width: gpsW(700.0),
        height: gpsH(1624.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              drawerInkStartColor,
              drawerInkEndColor,
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: gpsH(190.0)),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 0.0),
                child: Ink(
                  height: gpsH(80.0),
                  width: gpsW(410.0),
                  child: TextFormField(
                    controller:
                        context.watch<SearchProviderMy>().searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(.07),
                      hintText: "Find something",
                      hintStyle: hintStyle,
                      suffixIcon: const Icon(
                        Icons.search_outlined,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(
                          gpsW(35.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: gpsH(150.0)),
            ListView.builder(
              shrinkWrap: true,
              itemCount: context.watch<DrawerProviderMy>().items.length,
              itemBuilder: (_, __) {
                return ListTile(
                  onTap: (){
                    
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: gpsW(45.0),
                    child: Icon(
                      context.watch<DrawerProviderMy>().itemIcons[__],
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    context.watch<DrawerProviderMy>().items[__],
                    style: TextStyle(
                        fontSize: gpsW(25.0),
                        fontWeight: FontWeight.w700,
                        letterSpacing: gpsW(3.0),
                        color: Colors.white,
                        fontFamily: "Monserrat"),
                  ),
                );
              },
            ),
            SizedBox(height: gpsH(30.0)),
            ListTile(
              leading: const CircleAvatarWithBadgeMy(color: Colors.white),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your name",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: gpsW(30.0),
                    ),
                  ),
                  Text(
                    "Your Status",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: gpsW(22.0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
