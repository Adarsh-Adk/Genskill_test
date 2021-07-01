import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genskill_test/InjectionContainer.dart';
import 'package:genskill_test/core/constants/SizeConfig.dart';
import 'package:genskill_test/features/initial/domain/entities/Registrations.dart';
import 'package:genskill_test/features/initial/presentation/bloc/registration_page/registration_page_bloc.dart';
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
                      return ListView.builder(
                        itemCount:
                        state.registrationsDataModel.registrations.length,
                        itemBuilder: (context, index) {
                          Registration data =
                          state.registrationsDataModel.registrations[index];
                          return Card(
                            child: Container(
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
                                        Text("Id"),
                                        SizedBox(
                                          height:
                                          SizeConfig.blockSizeVertical * 1,
                                        ),
                                        Text("Subject"),
                                        SizedBox(
                                          height:
                                          SizeConfig.blockSizeVertical * 1,
                                        ),
                                        Text("Student"),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        BlocProvider.of<
                                            RegistrationPageBloc>(
                                            context)
                                            .add(DeleteRegistration(registrationId: data.id));
                                        // showDialog(context: context, builder: (context){
                                        //   return BlocProvider(
                                        //     create:(_)=> sl<StudentSubjectRegistrationBloc>(),
                                        //     child: BlocBuilder<StudentSubjectRegistrationBloc,StudentSubjectRegistrationState>(
                                        //       builder: (context,state){
                                        //         if (state is Loading) {
                                        //           return Dialog(insetPadding:dialogPadding,child: Container(height:SizeConfig.screenHeight*0.25,child: Center(child: CircularProgressIndicator(),)));
                                        //         }else if(state is Error){
                                        //           return Dialog(insetPadding:dialogPadding,child: Container(height:SizeConfig.screenHeight*0.25,child: Center(child:Text("${state.message}",textAlign: TextAlign.center,style: GoogleFonts.ubuntu(color: CColor.thumbsDown),))));
                                        //         }else if (state is Deleted){
                                        //           Future.delayed(Duration(seconds: 2),(){
                                        //             Navigator.pop(context);
                                        //           });
                                        //           return Dialog(insetPadding:dialogPadding,child: Container(height:SizeConfig.screenHeight*0.25,child: Center(child: Text(state.code==200?"Registration Deleted Successfully":"${state.code}",textAlign: TextAlign.center,style: GoogleFonts.ubuntu(color: CColor.thumbsUp),),)));
                                        //         }else if(state is Loaded) {
                                        //           return Container();
                                        //         }else return Dialog(child: Center(child: Container(color: Colors.blue,height: 50,width: 50,)));
                                        //       },
                                        //     ),
                                        //   );
                                        // });
                                        // BlocProvider.of<
                                        //             StudentSubjectRegistrationBloc>(
                                        //         context)
                                        //     .close();

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
                                        Text(data.id.toString()),
                                        SizedBox(
                                          height:
                                          SizeConfig.blockSizeVertical * 1,
                                        ),
                                        Text(data.subject.toString()),
                                        SizedBox(
                                          height:
                                          SizeConfig.blockSizeVertical * 1,
                                        ),
                                        Text(data.student.toString()),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
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

  // @override
  // void didChangeDependencies() {
  //   BlocProvider.of<RegistrationPageBloc>(context).add(GetRegistrations());
  // }
}


