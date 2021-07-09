import 'package:flutter/material.dart';
import 'CColor.dart';
class CTheme{
  static ThemeData get lightTheme{
    return ThemeData(primaryColor:CColor.PrimaryColor,backgroundColor: CColor.HomeScreenBGColor,textTheme: TextTheme(headline1: TextStyle(fontFamily:'Ubuntu',fontSize: 15,color:CColor.HomeScreenBGColor,fontWeight: FontWeight.w500),headline2: TextStyle(fontFamily:'Roboto',color:CColor.TextBlack,fontSize:15,fontWeight: FontWeight.w700), ));
  }
}