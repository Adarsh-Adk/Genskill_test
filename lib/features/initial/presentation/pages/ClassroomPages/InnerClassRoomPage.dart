import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genskill_test/core/constants/CColor.dart';
import 'package:genskill_test/core/constants/SizeConfig.dart';
import 'package:genskill_test/features/initial/presentation/bloc/inner_class_room_page/inner_class_room_page_bloc.dart';

import '../../../../../InjectionContainer.dart';

class InnerClasssRoomPage extends StatefulWidget {

  const InnerClasssRoomPage({Key key})
      : super(key: key);

  @override
  _InnerClasssRoomPageState createState() => _InnerClasssRoomPageState();
}

class _InnerClasssRoomPageState extends State<InnerClasssRoomPage> {
  final double gap = SizeConfig.blockSizeVertical * 1;

  final double _width = SizeConfig.screenWidth * 0.45;

  final TextAlign align2 = TextAlign.end;

  final TextAlign align1 = TextAlign.start;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: sl<InnerClassRoomPageBloc>(),
        child: BlocBuilder<InnerClassRoomPageBloc, InnerClassRoomPageState>(
            builder: (context, state) {
              if (state is Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Loaded) {
               return Scaffold(
                  appBar: AppBar(
                    title: Text("${state.classroom.name}"),
                  ),
                  body: Container(
                    height: SizeConfig.screenHeight,
                    width: SizeConfig.screenWidth,
                child:Center(
                    child: Card(

                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: SizeConfig.screenWidth * 0.8,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Classroom Name",
                                    style: TextStyle(
                                        color: CColor.HomeScreenBGColor),
                                  ),
                                  Container(
                                    width: _width,
                                    child: Text(
                                      state.classroom.name ?? "N/A",
                                      textAlign: align2,
                                      style:
                                      TextStyle(
                                          color: CColor.HomeScreenBGColor),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: gap,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Classroom Id",
                                    style: TextStyle(
                                        color: CColor.HomeScreenBGColor),
                                  ),
                                  Container(
                                    width: _width,
                                    child: Text(
                                      state.classroom.id.toString() ?? "N/A",
                                      textAlign: align2,
                                      style:
                                      TextStyle(
                                          color: CColor.HomeScreenBGColor),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: gap,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Classroom Subject",
                                    style: TextStyle(
                                        color: CColor.HomeScreenBGColor),
                                  ),
                                  Container(
                                    width: _width,
                                    child: Text(
                                      state.classroom.subject == ""
                                          ? "Not Assigned"
                                          : "N/A",
                                      textAlign: align2,
                                      style:
                                      TextStyle(
                                          color: CColor.HomeScreenBGColor),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: gap,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Classroom Layout",
                                    style: TextStyle(
                                        color: CColor.HomeScreenBGColor),
                                  ),
                                  Container(
                                    width: _width,
                                    child: Text(
                                      state.classroom.layout ?? "N/A",
                                      textAlign: align2,
                                      style:
                                      TextStyle(
                                          color: CColor.HomeScreenBGColor),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: gap,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Classroom Size",
                                    style: TextStyle(
                                        color: CColor.HomeScreenBGColor),
                                  ),
                                  Container(
                                    width: _width,
                                    child: Text(
                                      state.classroom.size.toString() ?? "N/A",
                                      textAlign: align2,
                                      style:
                                      TextStyle(
                                          color: CColor.HomeScreenBGColor),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))));
              } else if (state is Empty) {
                return Center(
                  child: Text("Empty"),
                );
              } else if (state is Error) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return Center(
                  child: Text("a custom error occured"),
                );
              }
            }
            )
    );
  }
}