import 'package:flutter/material.dart';
import '../../../../core/constants/CColor.dart';
import '../../../../core/constants/SizeConfig.dart';
import '../../domain/entities/ClassRoom.dart';


class ClassRoomCard extends StatefulWidget{
  final Classrooms classroom;


  ClassRoomCard({Key key,@required this.classroom}) : super(key: key);

  @override
  _ClassRoomCardState createState() => _ClassRoomCardState();
}

class _ClassRoomCardState extends State<ClassRoomCard> {
  final double gap = SizeConfig.blockSizeVertical * 1;

  final double _width = SizeConfig.screenWidth * 0.45;

  final TextAlign align2 = TextAlign.end;

  final TextAlign align1 = TextAlign.start;

  @override
  Widget build(BuildContext context) {

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.lightBlue,
                  Colors.lightBlueAccent,
                  Colors.lightBlue
                ])),
        child: Padding(padding: EdgeInsets.symmetric(horizontal:10.0,vertical: 15),
          child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Classroom Name",
              style: TextStyle(color: CColor.HomeScreenBGColor),
            ),
            Container(
              width: _width,
              child: Text(
                widget.classroom.name ?? "N/A",
                textAlign: align2,
                style: TextStyle(color: CColor.HomeScreenBGColor),
              ),
            ),
          ],
        ),),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Card(
  //     clipBehavior: Clip.antiAlias,
  //     elevation: 10,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //     child: Container(
  //       decoration: BoxDecoration(
  //           gradient: LinearGradient(
  //               begin: Alignment.topRight,
  //               end: Alignment.bottomLeft,
  //               colors: [
  //                 Colors.lightBlue,
  //                 Colors.lightBlueAccent,
  //                 Colors.lightBlue
  //               ])),
  //       child: Theme(
  //         data: ThemeData(
  //           unselectedWidgetColor: Colors.white,
  //         ),
  //         child: ExpansionTile(
  //           backgroundColor: Colors.transparent,
  //           initiallyExpanded: false,
  //           title: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Container(
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         "Name",
  //                         style: TextStyle(color: CColor.HomeScreenBGColor),
  //                       ),
  //                       Container(
  //                         width: _width,
  //                         child: Text(
  //                           widget.classroom.name ?? "N/A",
  //                           textAlign: align2,
  //                           style: TextStyle(color: CColor.HomeScreenBGColor),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   SizedBox(
  //                     height: gap,
  //                   ),
  //
  //                 ],
  //               ),
  //             ),
  //           ),
  //           collapsedBackgroundColor: Colors.transparent,
  //           children: [
  //             Container(
  //               padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 2),
  //               child: Column(
  //                 children: [
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         "Id",
  //                         style: TextStyle(color: CColor.HomeScreenBGColor),
  //                       ),
  //                       Container(
  //                         width: _width,
  //                         child: Text(
  //                           widget.classroom.id.toString() ?? "N/A",
  //                           textAlign: align2,
  //                           style: TextStyle(color: CColor.HomeScreenBGColor),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   SizedBox(
  //                     height: gap,
  //                   ),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Container(
  //                         width: _width,
  //                         child: Text(
  //                           "Size",
  //                           textAlign: align1,
  //                           style: TextStyle(color: CColor.HomeScreenBGColor),
  //                         ),
  //                       ),
  //                       Container(
  //                           width: _width,
  //                           child: Text(
  //                             widget.classroom.size.toString() ?? "N/A",
  //                             textAlign: align2,
  //                             style: TextStyle(color: CColor.HomeScreenBGColor),
  //                           )),
  //                     ],
  //                   ),
  //                   SizedBox(
  //                     height: gap,
  //                   ),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Container(
  //                         width: _width,
  //                         child: Text(
  //                           "Layout",
  //                           textAlign: align1,
  //                           style: TextStyle(color: CColor.HomeScreenBGColor),
  //                         ),
  //                       ),
  //                       Container(
  //                           width: _width,
  //                           child: Text(
  //                             widget.classroom.layout ?? "N/A",
  //                             textAlign: align2,
  //                             style: TextStyle(color: CColor.HomeScreenBGColor),
  //                           )),
  //                     ],
  //                   ),
  //                   SizedBox(
  //                     height: gap,
  //                   ),
  //                 ],
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

}
