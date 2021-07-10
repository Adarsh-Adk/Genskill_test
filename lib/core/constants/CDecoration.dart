import 'package:flutter/material.dart';
import 'CColor.dart';
class CDecoration{
  static BoxDecoration HomePageGrid=BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomCenter,colors: [Colors.white,Colors.white38])
  );

  static BoxDecoration InnerClassRoomDialogue=BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: CColor.HomeScreenBGColor
  );
}
