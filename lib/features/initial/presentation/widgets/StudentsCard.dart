import 'package:flutter/material.dart';
import 'package:genskill_test/core/constants/CColor.dart';
import 'package:genskill_test/core/constants/SizeConfig.dart';
import 'package:genskill_test/features/initial/domain/entities/Students.dart';

class StudentsCard extends StatefulWidget{
  final Student student;


  StudentsCard({Key key,@required this.student}) : super(key: key);

  @override
  _StudentsCardState createState() => _StudentsCardState();
}

class _StudentsCardState extends State<StudentsCard> {
  final double gap = SizeConfig.blockSizeVertical * 1;

  final double _width = SizeConfig.screenWidth * 0.45;

  final TextAlign align2 = TextAlign.end;

  final TextAlign align1 = TextAlign.start;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
        child: Theme(
          data: ThemeData(
            unselectedWidgetColor: Colors.white,
          ),
          child: ExpansionTile(
            backgroundColor: Colors.transparent,
            initiallyExpanded: false,
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(color: CColor.HomeScreenBGColor),
                        ),
                        Container(
                          width: _width,
                          child: Text(
                            widget.student.name ?? "N/A",
                            textAlign: align2,
                            style: TextStyle(color: CColor.HomeScreenBGColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: gap,
                    ),

                  ],
                ),
              ),
            ),
            collapsedBackgroundColor: Colors.transparent,
            children: [
              Container(
                padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 2),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Id",
                          style: TextStyle(color: CColor.HomeScreenBGColor),
                        ),
                        Container(
                          width: _width,
                          child: Text(
                            widget.student.id.toString() ?? "N/A",
                            textAlign: align2,
                            style: TextStyle(color: CColor.HomeScreenBGColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: gap,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: _width,
                          child: Text(
                            "Age",
                            textAlign: align1,
                            style: TextStyle(color: CColor.HomeScreenBGColor),
                          ),
                        ),
                        Container(
                            width: _width,
                            child: Text(
                              widget.student.age.toString() ?? "N/A",
                              textAlign: align2,
                              style: TextStyle(color: CColor.HomeScreenBGColor),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: gap,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: _width,
                          child: Text(
                            "Email",
                            textAlign: align1,
                            style: TextStyle(color: CColor.HomeScreenBGColor),
                          ),
                        ),
                        Container(
                            width: _width,
                            child: Text(
                              widget.student.email ?? "N/A",
                              textAlign: align2,
                              style: TextStyle(color: CColor.HomeScreenBGColor),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: gap,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
