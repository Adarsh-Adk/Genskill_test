import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../InjectionContainer.dart';
import '../../../../../core/constants/SizeConfig.dart';
import '../../../domain/entities/Registrations.dart';
import '../../bloc/registration_page/registration_page_bloc.dart';


class RegistrationsPage extends StatefulWidget{

  @override
  _RegistrationsPageState createState() => _RegistrationsPageState();
}

class _RegistrationsPageState extends State<RegistrationsPage> {
  
  
  
  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: [
        SvgPicture.asset('assets/images/Wave.svg',height: SizeConfig.screenHeight,fit: BoxFit.fitHeight,),
        BlocProvider(
            create:(_)=> sl<RegistrationPageBloc>(),
            child: Builder(builder: (context){
              BlocProvider.of<RegistrationPageBloc>(context).add(GetRegistrations());
              return Scaffold(
              appBar: AppBar(
                actions: [Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: IconButton(onPressed: (){ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Swipe card horizontally to delete")));}, icon: Icon(Icons.help_outline_outlined,color: Theme.of(context).backgroundColor,)),)],
                title: Text("Registrations",style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: SizeConfig.blockSizeHorizontal*5,color: Theme.of(context).backgroundColor),),
              ),
              body: Container(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                child: SafeArea(
                  child: BlocBuilder<RegistrationPageBloc,
                      RegistrationPageState>(
                    builder: (context, state) {
                      if (state is Loading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is Empty) {
                        return Center(
                          child: Text("There are no registrations",style: Theme.of(context).textTheme.headline2,),
                        );
                      } else if (state is Loaded) {
                        if(state.registrationsDataModel.toString()=="null"){
                          return Center(child: CircularProgressIndicator(),);
                        }else{ if (state.registrationsDataModel!.registrations.length ==
                            0) {
                          return Center(
                            child: Text("Registrations list is empty",textAlign: TextAlign.center,style:Theme.of(context).textTheme.headline2!.copyWith(fontSize: SizeConfig.blockSizeHorizontal*5)),
                          );
                        } else {
                          return listViewWidget(state);
                        }}
                      } else if (state is Error) {
                        return Center(
                          child: Text("${state.message}",style: Theme.of(context).textTheme.headline2,),
                        );
                      } else {
                        return Center(
                          child: Text("An unexpected error occurred",style: Theme.of(context).textTheme.headline2,),
                        );
                      }
                    },
                  ),
                ),
              ),
            );}),
        ),
      ],
    );
  }

  ListView listViewWidget(Loaded state) {
    return ListView.builder(
      itemCount:
      state.registrationsDataModel!.registrations.length,
      itemBuilder: (context, index) {
        Registration data =
        state.registrationsDataModel!.registrations[index];
        return customRegistrationCard(context, data);
      },
    );
  }

  Dismissible customRegistrationCard(BuildContext context, Registration data) {
    return Dismissible(
      key: Key(data.id.toString()),
      onDismissed: (Direction){
        BlocProvider.of<
            RegistrationPageBloc>(
            context)
            .add(DeleteRegistration(registrationId: data.id));

        BlocProvider.of<
            RegistrationPageBloc>(
            context)
            .add(GetRegistrations());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Container(
            decoration:  BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Theme.of(context).backgroundColor,
                      Theme.of(context).backgroundColor,
                    ])),
            width: SizeConfig.screenWidth! * 9,
            padding: EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: SizeConfig.screenWidth! * 0.28,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text("Id",style: Theme.of(context).textTheme.headline1,),
                      SizedBox(
                        height:
                        SizeConfig.blockSizeVertical * 1,
                      ),
                      Text("Subject",style: Theme.of(context).textTheme.headline1),
                      SizedBox(
                        height:
                        SizeConfig.blockSizeVertical * 1,
                      ),
                      Text("Student",style: Theme.of(context).textTheme.headline1),
                    ],
                  ),
                ),
                Container(
                  width: SizeConfig.screenWidth! * 0.28,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.end,
                    children: [
                      Text(data.id.toString(),style: Theme.of(context).textTheme.headline1),
                      SizedBox(
                        height:
                        SizeConfig.blockSizeVertical * 1,
                      ),
                      Text(data.subject.toString(),style: Theme.of(context).textTheme.headline1),
                      SizedBox(
                        height:
                        SizeConfig.blockSizeVertical * 1,
                      ),
                      Text(data.student.toString(),style:Theme.of(context).textTheme.headline1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}


