import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genskill_test/core/constants/CColor.dart';
import 'package:genskill_test/core/constants/SizeConfig.dart';
import 'package:genskill_test/features/initial/domain/entities/ClassRoom.dart';
import 'package:genskill_test/features/initial/presentation/bloc/class_room_page/class_room_page_bloc.dart';
import 'package:genskill_test/features/initial/presentation/bloc/inner_class_room_page/inner_class_room_page_bloc.dart'
as inner;
import 'package:genskill_test/features/initial/presentation/widgets/ClassRoomCard.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../../InjectionContainer.dart';
import 'InnerClassRoomPage.dart';

class ClassRoomPage extends StatelessWidget {
  const ClassRoomPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ClassRooms"),
      ),
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        color: CColor.HomeScreenBGColor,
        child: SafeArea(
            child: BlocProvider(
              create: (_) => sl.get<ClassRoomPageBloc>(),
              child: BlocBuilder<ClassRoomPageBloc, ClassRoomPageState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return Center(
                      child: Text("Empty"),
                    );
                  } else if (state is Loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is Loaded) {
                    return ListView.builder(
                        itemCount: state.classrooms.classrooms.length,
                        itemBuilder: (context, index) {

                          return BlocProvider(
                            create:(_)=>sl<inner.InnerClassRoomPageBloc>() ,
                            child:Builder(
                              builder: (context) {
                                Classrooms classroom = state.classrooms
                                    .classrooms[index];
                                return GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<
                                          inner.InnerClassRoomPageBloc>(
                                          context)
                                          .add(
                                          inner.GetClassRoom(id: classroom.id));
                                      print(classroom.name);
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              child: InnerClasssRoomPage(
                                                classroom: classroom,
                                              ),
                                              type: PageTransitionType.fade));
                                    },
                                    child: ClassRoomCard(classroom: classroom));
                              },
                            ),
                          );
                        });
                  } else if (state is Error) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return Center(
                      child: Text("a custom error occured"),
                    );
                  }
                },
              ),
            )),
      ),
    );
  }
}
