import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genskill_test/core/constants/CColor.dart';
import 'package:genskill_test/core/constants/SizeConfig.dart';
import 'package:genskill_test/features/initial/presentation/bloc/inner_class_room_page/inner_class_room_page_bloc.dart';
import 'package:genskill_test/features/initial/presentation/bloc/subjects_page/subjects_page_bloc.dart'
    as sub;
import 'package:genskill_test/features/initial/presentation/widgets/CustomRaisedGradientButton.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../InjectionContainer.dart';

class InnerClasssRoomPage extends StatefulWidget {
  const InnerClasssRoomPage({Key key}) : super(key: key);

  @override
  _InnerClasssRoomPageState createState() => _InnerClasssRoomPageState();
}

class _InnerClasssRoomPageState extends State<InnerClasssRoomPage> {
  final double gap = SizeConfig.blockSizeVertical * 1;

  final double _width = SizeConfig.screenWidth * 0.45;

  final TextAlign align2 = TextAlign.end;

  final TextAlign align1 = TextAlign.start;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: sl<InnerClassRoomPageBloc>(),
        child: BlocBuilder<InnerClassRoomPageBloc, InnerClassRoomPageState>(
            builder: (context, state) {
          if (state is Loading) {
            return Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is Loaded) {
            return Scaffold(
              appBar: AppBar(
                title: Text("${state.classroom.name}"),
              ),
              body: Container(
                  height: SizeConfig.screenHeight,
                  width: SizeConfig.screenWidth,
                  child: Center(
                      child: Card(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: SizeConfig.screenWidth * 0.8,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Classroom Name",
                                  style: TextStyle(
                                      color: CColor.HomeScreenBGColor),
                                ),
                                Container(
                                  width: _width,
                                  child: Text(
                                    state.classroom.name ?? "N/A",
                                    textAlign: align2,
                                    style: TextStyle(
                                        color: CColor.HomeScreenBGColor),
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
                                Text(
                                  "Classroom Id",
                                  style: TextStyle(
                                      color: CColor.HomeScreenBGColor),
                                ),
                                Container(
                                  width: _width,
                                  child: Text(
                                    state.classroom.id.toString() ?? "N/A",
                                    textAlign: align2,
                                    style: TextStyle(
                                        color: CColor.HomeScreenBGColor),
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
                                Text(
                                  "Classroom Subject",
                                  style: TextStyle(
                                      color: CColor.HomeScreenBGColor),
                                ),
                                Container(
                                  width: _width,
                                  child: Text(
                                    state.classroom.subject == ""
                                        ? "Not Assigned"
                                        : state.classroom.subject,
                                    textAlign: align2,
                                    style: TextStyle(
                                        color: CColor.HomeScreenBGColor),
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
                                Text(
                                  "Classroom Layout",
                                  style: TextStyle(
                                      color: CColor.HomeScreenBGColor),
                                ),
                                Container(
                                  width: _width,
                                  child: Text(
                                    state.classroom.layout ?? "N/A",
                                    textAlign: align2,
                                    style: TextStyle(
                                        color: CColor.HomeScreenBGColor),
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
                                Text(
                                  "Classroom Size",
                                  style: TextStyle(
                                      color: CColor.HomeScreenBGColor),
                                ),
                                Container(
                                  width: _width,
                                  child: Text(
                                    state.classroom.size.toString() ?? "N/A",
                                    textAlign: align2,
                                    style: TextStyle(
                                        color: CColor.HomeScreenBGColor),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          insetPadding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.1,
                              vertical: SizeConfig.screenHeight * 0.1),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.screenWidth * 0.1,
                                vertical: SizeConfig.screenHeight * 0.05),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                BlocProvider(
                                  create: (_) => sl<sub.SubjectsPageBloc>(),
                                  child: Builder(
                                    builder: (context2) {
                                      return CustomRaisedGradientButton(
                                          child: Container(
                                            width:
                                                SizeConfig.screenWidth * 0.48,
                                            child: Center(
                                              child: Text(
                                                state.classroom.subject == ""
                                                    ? "Assign Subject"
                                                    : "Change Subject",
                                                style: GoogleFonts.roboto(
                                                    color: CColor
                                                        .HomeScreenBGColor,
                                                    fontSize: SizeConfig
                                                            .blockSizeVertical *
                                                        3),
                                              ),
                                            ),
                                          ),
                                          gradient: LinearGradient(
                                              colors: [
                                                CColor
                                                    .HomeScreenClassButtonLeft,
                                                CColor
                                                    .HomeScreenClassButtonRight
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight),
                                          height:
                                              SizeConfig.blockSizeVertical * 7,
                                          onPressed: () {
                                            Navigator.pop(context);
                                            BlocProvider.of<
                                                        sub.SubjectsPageBloc>(
                                                    context2)
                                                .add(sub.GetSubject());
                                            showDialog(
                                                context: context2,
                                                builder: (context2) {
                                                  return Dialog(
                                                    insetPadding: EdgeInsets.symmetric(
                                                        horizontal: SizeConfig
                                                                .screenWidth *
                                                            0.1,
                                                        vertical: SizeConfig
                                                                .screenHeight *
                                                            0.1),
                                                    child: Container(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: SizeConfig
                                                                    .screenWidth *
                                                                0.1,
                                                            vertical: SizeConfig
                                                                    .screenHeight *
                                                                0.05),
                                                        child:
                                                            BlocProvider.value(
                                                          value: sl<
                                                              sub.SubjectsPageBloc>(),
                                                          child: BlocBuilder<
                                                              sub.SubjectsPageBloc,
                                                              sub.SubjectsPageState>(
                                                            builder: (context2,
                                                                state2) {
                                                              if (state2 is sub
                                                                  .Loading) {
                                                                return Center(
                                                                  child:
                                                                      CircularProgressIndicator(),
                                                                );
                                                              } else if (state2
                                                                  is sub
                                                                      .Error) {
                                                                return Center(
                                                                  child: Text(state2
                                                                      .message),
                                                                );
                                                              } else if (state2
                                                                  is sub
                                                                      .Loaded) {
                                                                return ListView(
                                                                  shrinkWrap:
                                                                      true,
                                                                  children: state2
                                                                      .subjectsDataModel
                                                                      .subjects
                                                                      .map((e) =>
                                                                          BlocProvider
                                                                              .value(
                                                                            value:
                                                                                sl<InnerClassRoomPageBloc>(),
                                                                            child:
                                                                                Builder(
                                                                              builder: (
                                                                                context3,
                                                                              ) {
                                                                                return OutlinedButton(
                                                                                    style: ButtonStyle(
                                                                                      side: MaterialStateProperty.resolveWith((states) {
                                                                                        Color _borderColor;

                                                                                        if (states.contains(MaterialState.disabled)) {
                                                                                          _borderColor = CColor.HomeScreenSubjectButtonLeft;
                                                                                        } else if (states.contains(MaterialState.pressed)) {
                                                                                          _borderColor = CColor.HomeScreenSubjectButtonLeft;
                                                                                        } else {
                                                                                          _borderColor = CColor.HomeScreenSubjectButtonLeft;
                                                                                        }

                                                                                        return BorderSide(color: _borderColor, width: 1);
                                                                                      }),
                                                                                    ),
                                                                                    onPressed: () {
                                                                                      BlocProvider.of<InnerClassRoomPageBloc>(context3).add(SetSubject(classRoomId: state.classroom.id, subjectId: e.id));
                                                                                      Navigator.pop(context3);
                                                                                    },
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: Text(
                                                                                        e.name,
                                                                                        style: TextStyle(color: CColor.HomeScreenStudentButtonLeft),
                                                                                      ),
                                                                                    ));
                                                                              },
                                                                            ),
                                                                          ))
                                                                      .toList(),
                                                                );
                                                              } else {
                                                                return Text(
                                                                  "An error occured",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        )),
                                                  );
                                                });
                                          },
                                          radius:
                                              SizeConfig.blockSizeVertical * 4);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeVertical * 4,
                                ),
                                CustomRaisedGradientButton(
                                    child: Container(
                                      width: SizeConfig.screenWidth * 0.48,
                                      child: Center(
                                        child: Text(
                                          "Assign Student",
                                          style: GoogleFonts.roboto(
                                              color: CColor.HomeScreenBGColor,
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      3),
                                        ),
                                      ),
                                    ),
                                    gradient: LinearGradient(
                                        colors: [
                                          CColor.HomeScreenClassButtonLeft,
                                          CColor.HomeScreenClassButtonRight
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight),
                                    height: SizeConfig.blockSizeVertical * 7,
                                    onPressed: () {},
                                    radius: SizeConfig.blockSizeVertical * 4)
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Icon(
                  Icons.edit,
                  color: CColor.HomeScreenBGColor,
                ),
              ),
            );
          } else if (state is Empty) {
            return Material(
              child: Center(
                child: Text("Empty"),
              ),
            );
          } else if (state is Error) {
            return Material(
              child: Center(
                child: Text(state.message),
              ),
            );
          } else {
            return Material(
              child: Center(
                child: Text("a custom error occured"),
              ),
            );
          }
        }));
  }
}
