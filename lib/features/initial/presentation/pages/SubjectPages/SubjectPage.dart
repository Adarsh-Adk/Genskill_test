import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/SizeConfig.dart';
import '../../../domain/entities/Subjects.dart';
import '../../bloc/subjects_page/subjects_page_bloc.dart';
import '../../widgets/SubjectsCard.dart';
import '../../../../../InjectionContainer.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/images/Wave.svg',height: SizeConfig.screenHeight,fit: BoxFit.fitHeight,),
        Scaffold(
          appBar: AppBar(title: Text("Subjects",style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: SizeConfig.blockSizeHorizontal*5,color: Theme.of(context).backgroundColor),),),
          body: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: SafeArea(
                child: BlocProvider(
                  create: (_) => sl.get<SubjectsPageBloc>(),
                  child: Builder(
                    builder: (context) {
                      BlocProvider.of<SubjectsPageBloc>(context).add(GetSubject());
                      return BlocBuilder<SubjectsPageBloc, SubjectsPageState>(
                        builder: (context, state) {
                          if (state is Empty) {
                            return Center(child: Text("Empty",style: Theme.of(context).textTheme.headline2,),);
                          } else if (state is Loading) {
                            return Center(child: CircularProgressIndicator(),);
                          } else if (state is Loaded) {
                            return ListView.builder(
                                itemCount: state.subjectsDataModel!.subjects.length,
                                itemBuilder: (context, index) {
                                  Subject subject = state.subjectsDataModel!
                                      .subjects[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                                    child: SubjectsCard(subject: subject,),
                                  );
                                });
                          } else if (state is Error) {
                            return Center(child: Text(state.message!,style: Theme.of(context).textTheme.headline2,),);
                          } else {
                            return Center(child: Text("a custom error occurred",style: Theme.of(context).textTheme.headline2,),);
                          }
                        },
                      );
                    },
                  ),
                )
            ),
          ),
        ),
      ],
    );
  }
}