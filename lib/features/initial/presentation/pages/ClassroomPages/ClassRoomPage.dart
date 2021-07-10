import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constants/SizeConfig.dart';
import '../../../domain/entities/ClassRoom.dart';
import '../../bloc/class_room_page/class_room_page_bloc.dart';
import '../../widgets/ClassRoomCard.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../../InjectionContainer.dart';
import 'InnerClassRoomPage.dart';

class ClassRoomPage extends StatelessWidget {
  const ClassRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/images/Wave.svg',height: SizeConfig.screenHeight,fit: BoxFit.fitHeight,),
        Scaffold(
          appBar: AppBar(
            title: Text("Classrooms",style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: SizeConfig.blockSizeHorizontal*5,color: Theme.of(context).backgroundColor),),
          ),
          body: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: SafeArea(
                child: BlocProvider(
                  create: (_) => sl.get<ClassRoomPageBloc>(),
                  child: Builder(
                    builder: (context) {
                      BlocProvider.of<ClassRoomPageBloc>(context).add(GetClassRooms());
                      return BlocBuilder<ClassRoomPageBloc, ClassRoomPageState>(
                        builder: (context, state) {
                          if (state is Empty) {
                            return Center(
                              child: Text("Empty",style: Theme.of(context).textTheme.headline2,),
                            );
                          } else if (state is Loading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is Loaded) {
                            return ListView.builder(
                                itemCount: state.classrooms!.classrooms.length,
                                itemBuilder: (context, index) {

                                  return Builder(
                                    builder: (context) {
                                      Classrooms classroom = state.classrooms!
                                          .classrooms[index];
                                      return GestureDetector(
                                          onTap: () {

                                            print(classroom.name);
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    child: InnerClassRoomPage(id: classroom.id,),
                                                    type: PageTransitionType.fade));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                                            child: ClassRoomCard(classroom: classroom),
                                          ));
                                    },
                                  );
                                });
                          } else if (state is Error) {
                            return Center(
                              child: Text(state.message!,style: Theme.of(context).textTheme.headline2,),
                            );
                          } else {
                            return Center(
                              child: Text("a custom error occured",style: Theme.of(context).textTheme.headline2,),
                            );
                          }
                        },
                      );
                    }
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
