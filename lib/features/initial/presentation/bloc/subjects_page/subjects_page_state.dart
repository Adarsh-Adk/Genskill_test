part of 'subjects_page_bloc.dart';

@immutable
abstract class SubjectsPageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loading extends SubjectsPageState {}
class Empty extends SubjectsPageState{}

class Loaded extends SubjectsPageState {

  final SubjectsDataModel? subjectsDataModel;

  Loaded( {this.subjectsDataModel,});

  @override
  List<Object?> get props => [subjectsDataModel];
}
class Error extends SubjectsPageState{
  final String? message;

  Error({this.message});

  @override
  List<Object?> get props => [message];
}
