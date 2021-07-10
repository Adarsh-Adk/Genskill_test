import 'package:flutter/material.dart';

import '../../../../core/constants/CDecoration.dart';
import '../../../../core/constants/CTheme.dart';
import '../../../../core/constants/SizeConfig.dart';

class CustomGridItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function function;
  final Color iconColor;
  final Color textColor;

  const CustomGridItem(
      {Key? key,
      required this.text,
      required this.icon,
      required this.function,
      required this.iconColor,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> function(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          clipBehavior: Clip.antiAlias,
          elevation: 3,
          child: Container(
            width: SizeConfig.screenWidth! * 0.35,
            height: SizeConfig.screenWidth! * 0.35,
            padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 6),
            decoration: CDecoration.HomePageGrid,
            child: Center(
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: this.iconColor,size: SizeConfig.blockSizeHorizontal*8,),
                    SizedBox(height: SizeConfig.blockSizeVertical*1,),
                    Text(
                      text,
                      style: CTheme.lightTheme.textTheme.headline1
                          ?.copyWith(color: this.textColor,fontSize: SizeConfig.blockSizeHorizontal*4.8),
                    )
                  ],
                )),
              ),
          ),
        ),
      ),
    );
  }
}
