import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/CustomGridItem.dart';
import '../../../../core/constants/SizeConfig.dart';
import 'RegistrationsPage/RegistrationsPage.dart';
import 'StudentPages/StudentPage.dart';
import 'SubjectPages/SubjectPage.dart';
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
      body: Stack(
        children: [
          SvgPicture.asset('assets/images/Wave.svg',height: SizeConfig.screenHeight,fit: BoxFit.fill,),
          Container(
            decoration: BoxDecoration(color: Colors.transparent),
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: SafeArea(
                child: Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(child: Text("Home",style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: SizeConfig.blockSizeHorizontal*8,color: Theme.of(context).backgroundColor))),
                        SizedBox(height: SizeConfig.blockSizeVertical*5,),
                        GridView(
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          children: [
                            CustomGridItem(
                              function: (){onStudentButtonPressed(context);},
                              icon: Icons.school,
                              text: "Students",
                              textColor: Theme.of(context).primaryColor,
                              iconColor:Theme.of(context).primaryColor,
                               ),
                            CustomGridItem(
                              function: ()=> onSubjectPress(context),
                              icon:  Icons.book,
                              text: "Subjects",
                              textColor: Theme.of(context).primaryColor,
                              iconColor:Theme.of(context).primaryColor,
                               ),
                            CustomGridItem(
                              function: ()=>onClassRoomButtonPressed(context),
                              icon: Icons.portrait,
                              text: "Classroom",
                              textColor: Theme.of(context).primaryColor,
                              iconColor:Theme.of(context).primaryColor,
                               ),
                            CustomGridItem(
                              function: (){
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: RegistrationsPage(),
                                        type: PageTransitionType.fade));
                              },
                              icon:   Icons.how_to_reg,
                              text: "Registrations",
                              textColor: Theme.of(context).primaryColor,
                              iconColor:Theme.of(context).primaryColor,
                               ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  void onSubjectPress(BuildContext context2) {
    Navigator.push(context2,
        PageTransition(child: SubjectPage(), type: PageTransitionType.fade));
  }

  void onStudentButtonPressed(BuildContext context2) {
    Navigator.push(context2,
        PageTransition(child: StudentPage(), type: PageTransitionType.fade));
  }

  void onClassRoomButtonPressed(BuildContext context2) {
    Navigator.push(context2,
        PageTransition(child: ClassRoomPage(), type: PageTransitionType.fade));
  }
}

