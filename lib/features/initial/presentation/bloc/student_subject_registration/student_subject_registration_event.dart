part of 'student_subject_registration_bloc.dart';

@immutable
abstract class StudentSubjectRegistrationEvent extends Equatable{

  @override
  List<Object> get props =>[];
}

class RegisterStudentSubject extends StudentSubjectRegistrationEvent{
  final int? subjectId;
  final int? studentId;
  RegisterStudentSubject({this.subjectId,this.studentId});
}

class DeleteRegistration extends StudentSubjectRegistrationEvent{
  final int? registrationId;
  DeleteRegistration({this.registrationId});
}

class GetRegistrations extends StudentSubjectRegistrationEvent{}