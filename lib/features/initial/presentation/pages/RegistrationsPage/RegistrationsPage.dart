import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../InjectionContainer.dart';
import '../../../../../core/constants/CColor.dart';
import '../../../../../core/constants/CStyles.dart';
import '../../../../../core/constants/SizeConfig.dart';
import '../../../domain/entities/Registrations.dart';
import '../../bloc/registration_page/registration_page_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationsPage extends StatefulWidget{

  @override
  _RegistrationsPageState createState() => _RegistrationsPageState();
}

class _RegistrationsPageState extends State<RegistrationsPage> {
  
  
  
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
        create:(_)=> sl<RegistrationPageBloc>(),
        child: Builder(builder: (context){
          BlocProvider.of<RegistrationPageBloc>(context).add(GetRegistrations());
          return Scaffold(
          appBar: AppBar(
            title: Text("Registrations"),
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
                      child: Text("There are no registrations"),
                    );
                  } else if (state is Loaded) {
                    if(state.registrationsDataModel.toString()=="null"){
                      return Center(child: CircularProgressIndicator(),);
                    }else{ if (state.registrationsDataModel.registrations.length ==
                        0) {
                      return Center(
                        child: Text("Registrations list is empty",textAlign: TextAlign.center,style: GoogleFonts.ubuntu(fontSize: SizeConfig.blockSizeHorizontal*5),),
                      );
                    } else {
                      return listViewWidget(state);
                    }}
                  } else if (state is Error) {
                    return Center(
                      child: Text("${state.message}"),
                    );
                  } else {
                    return Center(
                      child: Text("An unexpected error occurred"),
                    );
                  }
                },
              ),
            ),
          ),
        );}),
    );
  }

  ListView listViewWidget(Loaded state) {
    return ListView.builder(
      itemCount:
      state.registrationsDataModel.registrations.length,
      itemBuilder: (context, index) {
        Registration data =
        state.registrationsDataModel.registrations[index];
        return customRegistrationCard(context, data);
      },
    );
  }

  Card customRegistrationCard(BuildContext context, Registration data) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
        decoration:  BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.lightBlue,
                  Colors.lightBlueAccent,
                  Colors.lightBlue
                ])),
        width: SizeConfig.screenWidth * 9,
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: SizeConfig.screenWidth * 0.28,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                MainAxisAlignment.center,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text("Id",style: CStyles.registrationCardTextStyle,),
                  SizedBox(
                    height:
                    SizeConfig.blockSizeVertical * 1,
                  ),
                  Text("Subject",style: CStyles.registrationCardTextStyle),
                  SizedBox(
                    height:
                    SizeConfig.blockSizeVertical * 1,
                  ),
                  Text("Student",style: CStyles.registrationCardTextStyle),
                ],
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: CColor.HomeScreenBGColor,
                ),
                onPressed: () {
                  BlocProvider.of<
                      RegistrationPageBloc>(
                      context)
                      .add(DeleteRegistration(registrationId: data.id));

                  BlocProvider.of<
                      RegistrationPageBloc>(
                      context)
                      .add(GetRegistrations());

                }),
            Container(
              width: SizeConfig.screenWidth * 0.28,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                MainAxisAlignment.center,
                crossAxisAlignment:
                CrossAxisAlignment.end,
                children: [
                  Text(data.id.toString(),style: CStyles.registrationCardTextStyle),
                  SizedBox(
                    height:
                    SizeConfig.blockSizeVertical * 1,
                  ),
                  Text(data.subject.toString(),style: CStyles.registrationCardTextStyle),
                  SizedBox(
                    height:
                    SizeConfig.blockSizeVertical * 1,
                  ),
                  Text(data.student.toString(),style: CStyles.registrationCardTextStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}


