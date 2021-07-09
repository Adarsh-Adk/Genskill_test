import 'package:flutter/widgets.dart';

class SizeConfig {
  static  late MediaQueryData _mediaQueryData;
  static  double? screenWidth;
  static  double? screenHeight;
  static  late double blockSizeHorizontal;
  static  late double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
  }
}