import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenW;
  static double? screenH;
  static double? blockH;
  static double? blockV;
  static double? defaultPadding;
  static double? fontSize;
  static double? iconSize;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenW = _mediaQueryData!.size.width;
    screenH = _mediaQueryData!.size.height;
    defaultPadding = _mediaQueryData!.size.width * 0.01;
    blockH = screenW! / 100;
    blockV = screenH! / 100;
    fontSize = screenW! * 0.03;
    iconSize = screenW! * 0.04;
  }
}
