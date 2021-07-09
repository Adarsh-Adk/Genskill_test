part of 'StudentsPageBloc.dart';

abstract class StudentsPageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loaded extends StudentsPageState {
  final StudentsDataModel studentsDataModel;


  Loaded( {required this.studentsDataModel,});

  @override
  List<Object> get props => [studentsDataModel];
}

class Loading extends StudentsPageState{}

class Empty extends StudentsPageState{}

class Error extends StudentsPageState{
  final String? message;

  Error({this.message});

  @override
  List<Object?> get props => [message];
}