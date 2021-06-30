part of 'student_subject_registration_bloc.dart';

@immutable
abstract class StudentSubjectRegistrationState extends Equatable{

  @override
  List<Object> get props =>[];
}

class Loading extends StudentSubjectRegistrationState {}

class Empty extends StudentSubjectRegistrationState {}

class Error extends StudentSubjectRegistrationState {
  final String message;
  Error({this.message});
}

class Loaded extends StudentSubjectRegistrationState {
  final String code;
  Loaded({@required this.code});
}
