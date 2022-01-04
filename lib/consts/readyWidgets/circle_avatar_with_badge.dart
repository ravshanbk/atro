import 'package:atro/consts/SizeConfig/size_config.dart';
import 'package:flutter/material.dart';

class CircleAvatarWithBadgeMy extends StatelessWidget {
 final Color color;
  const CircleAvatarWithBadgeMy({required this.color, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: gpsH(124.0),
      width: gpsW(80.0),
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0.92, -0.92),
            child: Icon(
              Icons.circle,
              color: color,
                
              size: gpsW(15.0),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundImage:
               const    AssetImage("assets/images/img.jpg"),
              radius: gpsW(40.0),
            ),
          ),
        ],
      ),
    );
  }
}