import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../InjectionContainer.dart';
import '../../../../../core/constants/CColor.dart';
import '../../../../../core/constants/SizeConfig.dart';
import '../../../domain/entities/Students.dart';
import '../../bloc/StudentsPageBloc/StudentsPageBloc.dart';
import '../../widgets/StudentsCard.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Students"),),
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        color: CColor.HomeScreenBGColor,
        child: SafeArea(
            child: BlocProvider(
              create: (_) =>sl.get<StudentsPageBloc>(),
              child: Builder(
                builder: (context) {
                  BlocProvider.of<StudentsPageBloc>(context).add(GetStudent());
                  return BlocBuilder<StudentsPageBloc, StudentsPageState>(
                    builder: (context, state) {
                      if (state is Empty) {
                        return Center(child: Text("Empty"),);
                      } else if (state is Loading) {
                        return Center(child: CircularProgressIndicator(),);
                      } else if (state is Loaded) {
                        return ListView.builder(
                          itemCount: state.studentsDataModel.students.length,
                            itemBuilder: (context,index){
                            Student student=state.studentsDataModel.students[index];
                          return StudentsCard(student: student,);
                        });
                      } else if (state is Error) {
                        return Center(child: Text(state.message),);
                      } else {
                        return Center(child: Text("a custom error occured"),);
                      }
                    },
                  );
                }
              ),
            )
        ),
      ),
    );
  }
}
