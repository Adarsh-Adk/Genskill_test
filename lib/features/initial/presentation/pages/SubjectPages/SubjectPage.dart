import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/CColor.dart';
import '../../../../../core/constants/SizeConfig.dart';
import '../../../domain/entities/Subjects.dart';
import '../../bloc/subjects_page/subjects_page_bloc.dart';
import '../../widgets/SubjectsCard.dart';
import '../../../../../InjectionContainer.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Subjects"),),
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        color: CColor.HomeScreenBGColor,
        child: SafeArea(
            child: BlocProvider(
              create: (_) => sl.get<SubjectsPageBloc>(),
              child: Builder(
                builder: (context) {
                  BlocProvider.of<SubjectsPageBloc>(context).add(GetSubject());
                  return BlocBuilder<SubjectsPageBloc, SubjectsPageState>(
                    builder: (context, state) {
                      if (state is Empty) {
                        return Center(child: Text("Empty"),);
                      } else if (state is Loading) {
                        return Center(child: CircularProgressIndicator(),);
                      } else if (state is Loaded) {
                        return ListView.builder(
                            itemCount: state.subjectsDataModel.subjects.length,
                            itemBuilder: (context, index) {
                              Subject subject = state.subjectsDataModel
                                  .subjects[index];
                              return SubjectsCard(subject: subject,);
                            });
                      } else if (state is Error) {
                        return Center(child: Text(state.message),);
                      } else {
                        return Center(child: Text("a custom error occured"),);
                      }
                    },
                  );
                },
              ),
            )
        ),
      ),
    );
  }
}