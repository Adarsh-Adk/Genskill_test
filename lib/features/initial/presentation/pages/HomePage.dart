import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genskill_test/core/constants/CColor.dart';
import 'package:genskill_test/core/constants/SizeConfig.dart';
import 'package:genskill_test/features/initial/presentation/bloc/StudentsPageBloc/StudentsPageBloc.dart';
import 'package:genskill_test/features/initial/presentation/bloc/class_room_page/class_room_page_bloc.dart';
import 'package:genskill_test/features/initial/presentation/bloc/subjects_page/subjects_page_bloc.dart';
import 'package:genskill_test/features/initial/presentation/pages/RegistrationsPage/RegistrationsPage.dart';
import 'package:genskill_test/features/initial/presentation/pages/StudentPages/StudentPage.dart';
import 'package:genskill_test/features/initial/presentation/pages/SubjectPages/SubjectPage.dart';
import 'package:genskill_test/features/initial/presentation/widgets/CustomRaisedGradientButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'ClassroomPages/ClassRoomPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double gap = 20;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        color: CColor.HomeScreenBGColor,
        child: SafeArea(
            child: Center(
          child: Container(
            width: SizeConfig.screenWidth * 0.65,
            height: SizeConfig.screenHeight,
            color: CColor.HomeScreenBGColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomRaisedGradientButton(
                    child: Container(
                      width: SizeConfig.screenWidth * 0.48,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: SizeConfig.blockSizeHorizontal * 4,
                                child: Icon(
                                  Icons.school,
                                  color: CColor.HomeScreenBGColor,
                                )),
                            Text(
                              "Students",
                              style: GoogleFonts.roboto(
                                  color: CColor.HomeScreenBGColor,
                                  fontSize: SizeConfig.blockSizeVertical * 3),
                            ),
                            Container(
                                color: Colors.transparent,
                                width: SizeConfig.blockSizeHorizontal * 4)
                          ],
                        ),
                      ),
                    ),
                    gradient: LinearGradient(colors: [
                      CColor.HomeScreenStudentButtonLeft,
                      CColor.HomeScreenStudentButtonRight
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    height: SizeConfig.blockSizeVertical * 7,
                    onPressed: () {
                      onStudentButtonPressed(context);
                    },
                    radius: SizeConfig.blockSizeVertical * 4),
                SizedBox(
                  height: gap,
                ),
                CustomRaisedGradientButton(
                    child: Container(
                      width: SizeConfig.screenWidth * 0.48,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: SizeConfig.blockSizeHorizontal * 4,
                                child: Icon(
                                  Icons.book,
                                  color: CColor.HomeScreenBGColor,
                                )),
                            Text(
                              "Subjects",
                              style: GoogleFonts.roboto(
                                  color: CColor.HomeScreenBGColor,
                                  fontSize: SizeConfig.blockSizeVertical * 3),
                            ),
                            Container(
                                color: Colors.transparent,
                                width: SizeConfig.blockSizeHorizontal * 4)
                          ],
                        ),
                      ),
                    ),
                    gradient: LinearGradient(colors: [
                      CColor.HomeScreenSubjectButtonLeft,
                      CColor.HomeScreenSubjectButtonRight
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    height: SizeConfig.blockSizeVertical * 7,
                    onPressed: () {
                      onSubjectPress(context);
                    },
                    radius: SizeConfig.blockSizeVertical * 7),
                SizedBox(
                  height: gap,
                ),
                CustomRaisedGradientButton(
                    child: Container(
                      width: SizeConfig.screenWidth * 0.48,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: SizeConfig.blockSizeHorizontal * 4,
                                child: Icon(
                                  Icons.portrait,
                                  color: CColor.HomeScreenBGColor,
                                )),
                            Text(
                              "Classroom",
                              style: GoogleFonts.roboto(
                                  color: CColor.HomeScreenBGColor,
                                  fontSize: SizeConfig.blockSizeVertical * 3),
                            ),
                            Container(
                                color: Colors.transparent,
                                width: SizeConfig.blockSizeHorizontal * 4)
                          ],
                        ),
                      ),
                    ),
                    gradient: LinearGradient(colors: [
                      CColor.HomeScreenClassButtonLeft,
                      CColor.HomeScreenClassButtonRight
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    height: SizeConfig.blockSizeVertical * 7,
                    onPressed: () {
                      onClassRoomButtonPressed(context);
                    },
                    radius: SizeConfig.blockSizeVertical * 4),
                SizedBox(
                  height: gap,
                ),
                CustomRaisedGradientButton(
                    child: Container(
                      width: SizeConfig.screenWidth * 0.48,
                      child: Center(
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: SizeConfig.blockSizeHorizontal * 4,
                                child: Icon(
                                  Icons.portrait,
                                  color: CColor.HomeScreenBGColor,
                                )),
                            Text(
                              "Registrations",
                              style: GoogleFonts.roboto(
                                  color: CColor.HomeScreenBGColor,
                                  fontSize:
                                  SizeConfig.blockSizeVertical * 3),
                            ),
                            Container(
                                color: Colors.transparent,
                                width: SizeConfig.blockSizeHorizontal * 4)
                          ],
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
                      // BlocProvider.of<StudentSubjectRegistrationBloc>(
                      //         context2)
                      //     .add(GetRegistrations());
                      Navigator.push(
                          context,
                          PageTransition(
                              child: RegistrationsPage(),
                              type: PageTransitionType.fade));
                    },
                    radius: SizeConfig.blockSizeVertical * 4),
                // BlocProvider(
                //   create: (context2) => sl<StudentSubjectRegistrationBloc>(),
                //   child: Builder(
                //     builder: (context2) {
                //       return CustomRaisedGradientButton(
                //           child: Container(
                //             width: SizeConfig.screenWidth * 0.48,
                //             child: Center(
                //               child: Row(
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Container(
                //                       width: SizeConfig.blockSizeHorizontal * 4,
                //                       child: Icon(
                //                         Icons.portrait,
                //                         color: CColor.HomeScreenBGColor,
                //                       )),
                //                   Text(
                //                     "Registrations",
                //                     style: GoogleFonts.roboto(
                //                         color: CColor.HomeScreenBGColor,
                //                         fontSize:
                //                             SizeConfig.blockSizeVertical * 3),
                //                   ),
                //                   Container(
                //                       color: Colors.transparent,
                //                       width: SizeConfig.blockSizeHorizontal * 4)
                //                 ],
                //               ),
                //             ),
                //           ),
                //           gradient: LinearGradient(
                //               colors: [
                //                 CColor.HomeScreenClassButtonLeft,
                //                 CColor.HomeScreenClassButtonRight
                //               ],
                //               begin: Alignment.centerLeft,
                //               end: Alignment.centerRight),
                //           height: SizeConfig.blockSizeVertical * 7,
                //           onPressed: () {
                //             // BlocProvider.of<StudentSubjectRegistrationBloc>(
                //             //         context2)
                //             //     .add(GetRegistrations());
                //             Navigator.push(
                //                 context,
                //                 PageTransition(
                //                     child: RegistrationsPage(),
                //                     type: PageTransitionType.fade));
                //           },
                //           radius: SizeConfig.blockSizeVertical * 4);
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  void onSubjectPress(BuildContext context) {
    Navigator.push(context,
        PageTransition(child: SubjectPage(), type: PageTransitionType.fade));
  }

  void onStudentButtonPressed(BuildContext context) {
    Navigator.push(context,
        PageTransition(child: StudentPage(), type: PageTransitionType.fade));
  }

  void onClassRoomButtonPressed(BuildContext context) {
    Navigator.push(context,
        PageTransition(child: ClassRoomPage(), type: PageTransitionType.fade));
  }
}
