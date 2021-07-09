import 'package:flutter/material.dart';
import '../../../../core/constants/CColor.dart';
import '../../../../core/constants/SizeConfig.dart';
import '../../domain/entities/Subjects.dart';

class SubjectsCard extends StatefulWidget{
  final Subject subject;


  SubjectsCard({Key key,@required this.subject}) : super(key: key);

  @override
  _SubjectsCardState createState() => _SubjectsCardState();
}

class _SubjectsCardState extends State<SubjectsCard> {
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
                          "Subject",
                          style: TextStyle(color: CColor.HomeScreenBGColor),
                        ),
                        Container(
                          width: _width,
                          child: Text(
                            widget.subject.name ?? "N/A",
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
                            widget.subject.id.toString() ?? "N/A",
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
                            "Credits",
                            textAlign: align1,
                            style: TextStyle(color: CColor.HomeScreenBGColor),
                          ),
                        ),
                        Container(
                            width: _width,
                            child: Text(
                              widget.subject.credits.toString() ?? "N/A",
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
                            "Teacher",
                            textAlign: align1,
                            style: TextStyle(color: CColor.HomeScreenBGColor),
                          ),
                        ),
                        Container(
                            width: _width,
                            child: Text(
                              widget.subject.teacher ?? "N/A",
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
