import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

double gpsH(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 1624.0) * screenHeight;
}

double gpsW(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 750.0) * screenWidth;
}
