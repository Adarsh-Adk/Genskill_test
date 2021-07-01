part of 'registration_page_bloc.dart';

@immutable
abstract class RegistrationPageState extends Equatable{
  @override
List<Object> get props =>[];
}

class Loading extends RegistrationPageState {}

class Empty extends RegistrationPageState {}

class Error extends RegistrationPageState {
  final String message;
  Error({this.message});
}

class Loaded extends RegistrationPageState {

  final int code;
  final RegistrationsDataModel registrationsDataModel;
  Loaded({ this.code, this.registrationsDataModel});
}

class Deleted extends RegistrationPageState{
  final int code;

  Deleted({@required this.code});

}
