part of 'registration_page_bloc.dart';

@immutable
abstract class RegistrationPageEvent extends Equatable {
  @override
  List<Object> get props =>[];
}

class RegisterStudentSubject extends RegistrationPageEvent{
  final int subjectId;
  final int studentId;
  RegisterStudentSubject({this.subjectId,this.studentId});
}

class DeleteRegistration extends RegistrationPageEvent{
  final int registrationId;
  DeleteRegistration({this.registrationId});
}

class GetRegistrations extends RegistrationPageEvent{}