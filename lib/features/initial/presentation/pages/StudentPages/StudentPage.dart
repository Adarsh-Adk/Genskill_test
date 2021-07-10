// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../InjectionContainer.dart';
// import '../../../../../core/constants/SizeConfig.dart';
// import '../../../domain/entities/Students.dart';
// import '../../bloc/StudentsPageBloc/StudentsPageBloc.dart';
// import '../../widgets/StudentsCard.dart';
//
// class StudentPage extends StatelessWidget {
//   const StudentPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Students",style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: SizeConfig.blockSizeHorizontal*5),),),
//       body: Container(
//         width: SizeConfig.screenWidth,
//         height: SizeConfig.screenHeight,
//         color:Theme.of(context).backgroundColor,
//         child: SafeArea(
//             child: BlocProvider(
//               create: (_) =>sl.get<StudentsPageBloc>(),
//               child: Builder(
//                 builder: (context) {
//                   BlocProvider.of<StudentsPageBloc>(context).add(GetStudent());
//                   return BlocBuilder<StudentsPageBloc, StudentsPageState>(
//                     builder: (context, state) {
//                       if (state is Empty) {
//                         return Center(child: Text("Empty",style: Theme.of(context).textTheme.headline2,),);
//                       } else if (state is Loading) {
//                         return Center(child: CircularProgressIndicator(),);
//                       } else if (state is Loaded) {
//                         return ListView.builder(
//                           itemCount: state.studentsDataModel.students.length,
//                             itemBuilder: (context,index){
//                             Student student=state.studentsDataModel.students[index];
//                           return StudentsCard(student: student,);
//                         });
//                       } else if (state is Error) {
//                         return Center(child: Text(state.message!,style: Theme.of(context).textTheme.headline2,),);
//                       } else {
//                         return Center(child: Text("Connection error occurred",style: Theme.of(context).textTheme.headline2,),);
//                       }
//                     },
//                   );
//                 }
//               ),
//             )
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../InjectionContainer.dart';
import '../../../../../core/constants/SizeConfig.dart';
import '../../../domain/entities/Students.dart';
import '../../bloc/StudentsPageBloc/StudentsPageBloc.dart';
import '../../widgets/StudentsCard.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/images/Wave.svg',height: SizeConfig.screenHeight,fit: BoxFit.fitHeight,),
        Scaffold(
          appBar: AppBar(title: Text("Students",style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: SizeConfig.blockSizeHorizontal*5,color: Theme.of(context).backgroundColor),),),
          body: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            // color:Theme.of(context).backgroundColor,
            child: SafeArea(
                child: BlocProvider(
                  create: (_) =>sl.get<StudentsPageBloc>(),
                  child: Builder(
                      builder: (context) {
                        BlocProvider.of<StudentsPageBloc>(context).add(GetStudent());
                        return BlocBuilder<StudentsPageBloc, StudentsPageState>(
                          builder: (context, state) {
                            if (state is Empty) {
                              return Center(child: Text("Empty",style: Theme.of(context).textTheme.headline2,),);
                            } else if (state is Loading) {
                              return Center(child: CircularProgressIndicator(),);
                            } else if (state is Loaded) {
                              return ListView.builder(
                                  itemCount: state.studentsDataModel.students.length,
                                  itemBuilder: (context,index){
                                    Student student=state.studentsDataModel.students[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                                      child: StudentsCard(student: student,),
                                    );
                                  });
                            } else if (state is Error) {
                              return Center(child: Text(state.message!,style: Theme.of(context).textTheme.headline2,),);
                            } else {
                              return Center(child: Text("Connection error occurred",style: Theme.of(context).textTheme.headline2,),);
                            }
                          },
                        );
                      }
                  ),
                )
            ),
          ),
        ),
      ],
    );
  }
}
