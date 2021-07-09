import 'package:flutter/material.dart';
import '../../../../core/constants/SizeConfig.dart';
import '../../domain/entities/ClassRoom.dart';


class ClassRoomCard extends StatefulWidget{
  final Classrooms classroom;


  ClassRoomCard({Key? key,required this.classroom}) : super(key: key);

  @override
  _ClassRoomCardState createState() => _ClassRoomCardState();
}

class _ClassRoomCardState extends State<ClassRoomCard> {
  final double gap = SizeConfig.blockSizeVertical * 1;

  final double _width = SizeConfig.screenWidth! * 0.45;

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
              style: Theme.of(context).textTheme.headline1,
            ),
            Container(
              width: _width,
              child: Text(
                widget.classroom.name ?? "N/A",
                textAlign: align2,
                style:Theme.of(context).textTheme.headline1,
              ),
            ),
          ],
        ),),
      ),
    );
  }
}
