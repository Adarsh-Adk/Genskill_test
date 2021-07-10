import 'package:flutter/material.dart';
import '../../../../core/constants/SizeConfig.dart';
import '../../domain/entities/Subjects.dart';

class SubjectsCard extends StatefulWidget{
  final Subject subject;


  SubjectsCard({Key? key,required this.subject}) : super(key: key);

  @override
  _SubjectsCardState createState() => _SubjectsCardState();
}

class _SubjectsCardState extends State<SubjectsCard> {
  final double gap = SizeConfig.blockSizeVertical * 1;

  final double _width = SizeConfig.screenWidth! * 0.4;

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: _width,
                      child: Text(
                        widget.subject.name ?? "N/A",
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
                            widget.subject.id.toString(),
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
                            "Credits",
                            textAlign: align1,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        Container(
                            width: _width,
                            child: Text(
                              widget.subject.credits.toString(),
                              textAlign: align2,
                              style:Theme.of(context).textTheme.headline1,
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
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        Container(
                            width: _width,
                            child: Text(
                              widget.subject.teacher ?? "N/A",
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
