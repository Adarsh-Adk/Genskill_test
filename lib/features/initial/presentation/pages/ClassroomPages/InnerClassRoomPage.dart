import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genskill_test/core/constants/CColor.dart';
import 'package:genskill_test/core/constants/SizeConfig.dart';
import 'package:genskill_test/features/initial/presentation/bloc/StudentsPageBloc/StudentsPageBloc.dart'
    as stud;
import 'package:genskill_test/features/initial/presentation/bloc/inner_class_room_page/inner_class_room_page_bloc.dart';
import 'package:genskill_test/features/initial/presentation/bloc/student_subject_registration/student_subject_registration_bloc.dart'
    as studsub;
import 'package:genskill_test/features/initial/presentation/bloc/subjects_page/subjects_page_bloc.dart'
    as sub;
import 'package:genskill_test/features/initial/presentation/widgets/CustomRaisedGradientButton.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../InjectionContainer.dart';

class InnerClassRoomPage extends StatefulWidget {
  final int id;
  const InnerClassRoomPage({Key key,@required this.id}) : super(key: key);

  @override
  _InnerClassRoomPageState createState() => _InnerClassRoomPageState();
}

class _InnerClassRoomPageState extends State<InnerClassRoomPage> {
  final double gap = SizeConfig.blockSizeVertical * 1;

  final double _width = SizeConfig.screenWidth * 0.45;

  final TextAlign align2 = TextAlign.end;

  final TextAlign align1 = TextAlign.start;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(_)=> sl<InnerClassRoomPageBloc>(),
        child: Builder(
          builder: (context) {
            BlocProvider.of<InnerClassRoomPageBloc>(
                context)
                .add(
                GetClassRoom(id: widget.id));
            return BlocBuilder<InnerClassRoomPageBloc, InnerClassRoomPageState>(
                builder: (context, state) {
              if (state is Loading) {
                return Material(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is Loaded) {
                print(state.classroom.subjectId);
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
                      showDialoge(context, state);
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
            });
          }
        ));
  }

  void showDialoge(BuildContext context, Loaded state) {
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
                              width: SizeConfig.screenWidth * 0.48,
                              child: Center(
                                child: Text(
                                  state.classroom.subject == ""
                                      ? "Assign Subject"
                                      : "Change Subject",
                                  style: GoogleFonts.roboto(
                                      color: CColor.HomeScreenBGColor,
                                      fontSize:
                                          SizeConfig.blockSizeVertical * 3),
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
                            onPressed: () {
                              showSubjects(context, context2, state);
                            },
                            radius: SizeConfig.blockSizeVertical * 4);
                      },
                    ),
                  ),
                  state.classroom.subject != ""
                      ? SizedBox(
                          height: SizeConfig.blockSizeVertical * 4,
                        )
                      : SizedBox(),
                  state.classroom.subject != ""
                      ? BlocProvider(
                          create: (context2) => sl<stud.StudentsPageBloc>(),
                          child: Builder(builder: (context2) {
                            return CustomRaisedGradientButton(
                                child: Container(
                                  width: SizeConfig.screenWidth * 0.48,
                                  child: Center(
                                    child: Text(
                                      "Assign Student",
                                      style: GoogleFonts.roboto(
                                          color: CColor.HomeScreenBGColor,
                                          fontSize:
                                              SizeConfig.blockSizeVertical * 3),
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
                                onPressed: () {
                                  showStudents(context, context2, state);
                                },
                                radius: SizeConfig.blockSizeVertical * 4);
                          }),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          );
        });
  }

  void showSubjects(BuildContext context, BuildContext context2, Loaded state) {
    Navigator.pop(context);
    showDialog(
        context: context2,
        builder: (context2) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.1,
                vertical: SizeConfig.screenHeight * 0.1),
            child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.1,
                    vertical: SizeConfig.screenHeight * 0.05),
                child: BlocProvider.value(
                  value: sl<sub.SubjectsPageBloc>(),
                  child:
                      Builder(
                        builder: (context2) {
                          BlocProvider.of<sub.SubjectsPageBloc>(context2).add(sub.GetSubject());
                          return BlocBuilder<sub.SubjectsPageBloc, sub.SubjectsPageState>(
                    builder: (context2, state2) {
                          if (state2 is sub.Loading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state2 is sub.Error) {
                            return Center(
                              child: Text(state2.message),
                            );
                          } else if (state2 is sub.Loaded) {
                            return ListView(
                              shrinkWrap: true,
                              children: state2.subjectsDataModel.subjects
                                  .map((e) => BlocProvider.value(
                                        value:sl<InnerClassRoomPageBloc>(),
                                        child: Builder(
                                          builder: (context3) {
                                            return OutlinedButton(
                                                style: ButtonStyle(
                                                  side: MaterialStateProperty
                                                      .resolveWith((states) {
                                                    Color _borderColor;

                                                    if (states.contains(
                                                        MaterialState.disabled)) {
                                                      _borderColor = CColor
                                                          .HomeScreenSubjectButtonLeft;
                                                    } else if (states.contains(
                                                        MaterialState.pressed)) {
                                                      _borderColor = CColor
                                                          .HomeScreenSubjectButtonLeft;
                                                    } else {
                                                      _borderColor = CColor
                                                          .HomeScreenSubjectButtonLeft;
                                                    }

                                                    return BorderSide(
                                                        color: _borderColor,
                                                        width: 1);
                                                  }),
                                                ),
                                                onPressed: () {
                                                  BlocProvider.of<
                                                      InnerClassRoomPageBloc>(
                                                      context3)
                                                      .add(SetSubject(
                                                      classRoomId:
                                                      state.classroom.id,
                                                      subjectId: e.id));
                                                  Navigator.pop(context3);
                                                  setState(() {
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    e.name,
                                                    style: TextStyle(
                                                        color: CColor
                                                            .HomeScreenStudentButtonLeft),
                                                  ),
                                                ));
                                          }
                                        )
                                      ))
                                  .toList(),
                            );
                          } else {
                            return Text(
                              "An error occured",
                              textAlign: TextAlign.center,
                            );
                          }
                    },
                  );
                        }
                      ),
                )),
          );
        });
  }

  void showStudents(BuildContext context, BuildContext context2, Loaded state) {
    Navigator.pop(context);
    showDialog(
        context: context2,
        builder: (context2) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.1,
                vertical: SizeConfig.screenHeight * 0.1),
            child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.1,
                    vertical: SizeConfig.screenHeight * 0.05),
                child: BlocProvider.value(
                  value: sl<stud.StudentsPageBloc>(),
                  child: Builder(
                    builder: (context2) {
                      BlocProvider.of<stud.StudentsPageBloc>(context2).add(stud.GetStudent());
                      return BlocBuilder<stud.StudentsPageBloc,
                          stud.StudentsPageState>(
                        builder: (context2, state2) {
                          if (state2 is stud.Loading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state2 is stud.Error) {
                            return Center(
                              child: Text(state2.message),
                            );
                          } else if (state2 is stud.Loaded) {
                            return BlocProvider(
                              create: (_) =>
                                  sl<studsub.StudentSubjectRegistrationBloc>(),
                              child: ListView(
                                shrinkWrap: true,
                                children: state2.studentsDataModel.students
                                    .map((e) => BlocProvider.value(
                                          value: sl<InnerClassRoomPageBloc>(),
                                          child: Builder(
                                            builder: (
                                              context3,
                                            ) {
                                              return OutlinedButton(
                                                  style: ButtonStyle(
                                                    side: MaterialStateProperty
                                                        .resolveWith((states) {
                                                      Color _borderColor;

                                                      if (states.contains(
                                                          MaterialState.disabled)) {
                                                        _borderColor = CColor
                                                            .HomeScreenSubjectButtonLeft;
                                                      } else if (states.contains(
                                                          MaterialState.pressed)) {
                                                        _borderColor = CColor
                                                            .HomeScreenSubjectButtonLeft;
                                                      } else {
                                                        _borderColor = CColor
                                                            .HomeScreenSubjectButtonLeft;
                                                      }

                                                      return BorderSide(
                                                          color: _borderColor,
                                                          width: 1);
                                                    }),
                                                  ),
                                                  onPressed: () {

                                                    showDialog(
                                                        context: context3,
                                                        builder: (context3) {
                                                          return BlocProvider.value(
                                                            value: sl<
                                                                studsub
                                                                    .StudentSubjectRegistrationBloc>(),
                                                            child: Builder(
                                                              builder: (context3) {
                                                                BlocProvider.of<
                                                                    studsub
                                                                        .StudentSubjectRegistrationBloc>(
                                                                    context3)
                                                                    .add(studsub
                                                                    .RegisterStudentSubject(
                                                                    subjectId:
                                                                    int.parse(state
                                                                        .classroom
                                                                        .subjectId),
                                                                    studentId: e.id));
                                                                return BlocBuilder<
                                                                    studsub
                                                                        .StudentSubjectRegistrationBloc,
                                                                    studsub
                                                                        .StudentSubjectRegistrationState>(
                                                                  builder: (context3,
                                                                      state4) {
                                                                    if (state4
                                                                        is studsub.Deleted) {
                                                                      if(state4.code==null){
                                                                        return Dialog(
                                                                            insetPadding:
                                                                            EdgeInsets.all(
                                                                                SizeConfig.screenWidth *
                                                                                    0.2),
                                                                            child: Container(
                                                                              width: SizeConfig.screenWidth*0.4,
                                                                              height: SizeConfig.screenHeight*0.2,
                                                                              padding: EdgeInsets.all(15),
                                                                              child: Center(
                                                                                child:
                                                                                CircularProgressIndicator(),
                                                                              ),
                                                                            ));
                                                                      }else{
                                                                        return Dialog(
                                                                          insetPadding:
                                                                          EdgeInsets.all(
                                                                              SizeConfig.screenWidth *
                                                                                  0.2),
                                                                          child: Card(
                                                                            child: Container(
                                                                                width: SizeConfig.screenWidth*0.4,
                                                                                height: SizeConfig.screenHeight*0.2,
                                                                                padding: EdgeInsets.all(15),
                                                                                child:Center(
                                                                                  child:
                                                                                  Text(state4.code==200?"Student added successfully":state4.code==409?"Student already registered":"An error occurred",textAlign: TextAlign.center,style: GoogleFonts.ubuntu(color: CColor.thumbsUp,fontSize: SizeConfig.blockSizeHorizontal*5),),
                                                                                )
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                    } else if (state4
                                                                        is studsub
                                                                            .Loading) {
                                                                      return Dialog(
                                                                          insetPadding:
                                                                              EdgeInsets.all(
                                                                                  SizeConfig.screenWidth *
                                                                                      0.2),
                                                                          child: Container(
                                                                            width: SizeConfig.screenWidth*0.4,
                                                                            height: SizeConfig.screenHeight*0.2,
                                                                            padding: EdgeInsets.all(15),
                                                                            child: Center(
                                                                              child:
                                                                                  CircularProgressIndicator(),
                                                                            ),
                                                                          ));
                                                                    } else if (state4
                                                                        is studsub
                                                                            .Error) {
                                                                      return Dialog(
                                                                        insetPadding:
                                                                            EdgeInsets.all(
                                                                                SizeConfig.screenWidth *
                                                                                    0.2),
                                                                        child: Container(
                                                                          width: SizeConfig.screenWidth*0.4,
                                                                          height: SizeConfig.screenHeight*0.2,
                                                                          padding: EdgeInsets.all(15),
                                                                          child: Center(
                                                                            child: Text(
                                                                                "${state4.message}",textAlign: TextAlign.center,style: GoogleFonts.ubuntu(color: CColor.thumbsDown,fontSize: SizeConfig.blockSizeHorizontal*5),),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return Dialog(
                                                                        insetPadding:
                                                                            EdgeInsets.all(
                                                                                SizeConfig.screenWidth *
                                                                                    0.2),
                                                                        child: Text(
                                                                            "An error occured"),
                                                                      );
                                                                    }
                                                                  },
                                                                );
                                                              }
                                                            ),
                                                          );
                                                        });
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      e.name,
                                                      style: TextStyle(
                                                          color: CColor
                                                              .HomeScreenStudentButtonLeft),
                                                    ),
                                                  ));
                                            },
                                          ),
                                        ))
                                    .toList(),
                              ),
                            );
                          } else {
                            return Text(
                              "An error occured",
                              textAlign: TextAlign.center,
                            );
                          }
                        },
                      );
                    }
                  ),
                )),
          );
        });
  }
}
