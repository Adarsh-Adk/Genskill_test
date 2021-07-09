import 'package:flutter/material.dart';
import '../../../../core/constants/CColor.dart';
import '../../../../core/constants/SizeConfig.dart';
import 'RegistrationsPage/RegistrationsPage.dart';
import 'StudentPages/StudentPage.dart';
import 'SubjectPages/SubjectPage.dart';
import '../widgets/CustomRaisedGradientButton.dart';
import 'package:page_transition/page_transition.dart';
import 'ClassroomPages/ClassRoomPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
        title: Text("Home",style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: SizeConfig.blockSizeHorizontal*5),),
      ),
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        color: Theme.of(context).backgroundColor,
        child: SafeArea(
            child: Center(
          child: Container(
            width: SizeConfig.screenWidth! * 0.65,
            height: SizeConfig.screenHeight,
            color: Theme.of(context).backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomRaisedGradientButton(
                    child: Container(
                      width: SizeConfig.screenWidth! * 0.48,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: SizeConfig.blockSizeHorizontal * 4,
                                child: Icon(
                                  Icons.school,
                                  color: Theme.of(context).backgroundColor,
                                )),
                            Text(
                              "Students",
                              style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: SizeConfig.blockSizeHorizontal*5),
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
                      width: SizeConfig.screenWidth! * 0.48,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: SizeConfig.blockSizeHorizontal * 4,
                                child: Icon(
                                  Icons.book,
                                  color: Theme.of(context).backgroundColor,
                                )),
                            Text(
                              "Subjects",
                              style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: SizeConfig.blockSizeHorizontal*5),
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
                      width: SizeConfig.screenWidth! * 0.48,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: SizeConfig.blockSizeHorizontal * 4,
                                child: Icon(
                                  Icons.portrait,
                                  color: Theme.of(context).backgroundColor,
                                )),
                            Text(
                              "Classroom",
                              style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: SizeConfig.blockSizeHorizontal*5),
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
                      width: SizeConfig.screenWidth! * 0.48,
                      child: Center(
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: SizeConfig.blockSizeHorizontal * 4,
                                child: Icon(
                                  Icons.how_to_reg,
                                  color: Theme.of(context).backgroundColor,
                                )),
                            Text(
                              "Registrations",
                              style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: SizeConfig.blockSizeHorizontal*5),
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

                      Navigator.push(
                          context,
                          PageTransition(
                              child: RegistrationsPage(),
                              type: PageTransitionType.fade));
                    },
                    radius: SizeConfig.blockSizeVertical * 4),
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
