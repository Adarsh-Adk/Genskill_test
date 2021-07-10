import 'package:flutter/material.dart';
import '../../../../core/constants/SizeConfig.dart';
import '../../domain/entities/Students.dart';

class StudentsCard extends StatefulWidget{
  final Student student;


  StudentsCard({Key? key,required this.student}) : super(key: key);

  @override
  _StudentsCardState createState() => _StudentsCardState();
}

class _StudentsCardState extends State<StudentsCard> {
  final double gap = SizeConfig.blockSizeVertical * 1;

  final double _width = SizeConfig.screenWidth! * 0.40;

  final TextAlign align2 = TextAlign.end;

  final TextAlign align1 = TextAlign.start;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Theme.of(context).backgroundColor,
                  Theme.of(context).backgroundColor,
                ])),
        child: Theme(
          data: ThemeData(
            unselectedWidgetColor: Colors.white,
          ),
          child: ExpansionTile(
            iconColor: Theme.of(context).primaryColor,
            collapsedIconColor: Theme.of(context).primaryColor,
            backgroundColor: Colors.transparent,
            initiallyExpanded: false,
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: _width,
                      child: Text(
                        widget.student.name ?? "N/A",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline1,
                      ),
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
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Container(
                          width: _width,
                          child: Text(
                            widget.student.id.toString(),
                            textAlign: align2,
                            style: Theme.of(context).textTheme.headline1,
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
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        Container(
                            width: _width,
                            child: Text(
                              widget.student.age.toString(),
                              textAlign: align2,
                              style: Theme.of(context).textTheme.headline1,
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
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        Container(
                            width: _width,
                            child: Text(
                              widget.student.email ?? "N/A",
                              textAlign: align2,
                              style: Theme.of(context).textTheme.headline1,
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
