import 'package:flutter/material.dart';
import 'CColor.dart';
class CTheme{
  static ThemeData get lightTheme{
    return ThemeData(primaryColor:CColor.PrimaryColor,accentColor:CColor.PrimaryColor,backgroundColor: CColor.HomeScreenBGColor,textTheme: TextTheme(headline1: TextStyle(fontFamily:'Ubuntu',fontSize: 15,color:CColor.PrimaryColor,fontWeight: FontWeight.w500),headline2: TextStyle(fontFamily:'Roboto',color:CColor.HomeScreenBGColor,fontSize:20,fontWeight: FontWeight.w500),),indicatorColor: CColor.PrimaryColor,scaffoldBackgroundColor: Colors.transparent,appBarTheme: AppBarTheme(backgroundColor: Colors.transparent,elevation: 0,));
  }
}