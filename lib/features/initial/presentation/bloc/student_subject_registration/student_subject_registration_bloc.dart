import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/Failures.dart';
import '../../../../../core/usecases/UseCase.dart';
import '../../../domain/entities/Registrations.dart';
import '../../../domain/usecases/RegistrationsDeleteRegistrationUseCase.dart'as del;
import '../../../domain/usecases/RegistrationsGetRegistrationsUseCase.dart';
import '../../../domain/usecases/RegistrationsSetRegistrationUseCase.dart';
import 'package:meta/meta.dart';

part 'student_subject_registration_event.dart';

part 'student_subject_registration_state.dart';
const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class StudentSubjectRegistrationBloc extends Bloc<StudentSubjectRegistrationEvent, StudentSubjectRegistrationState> {
  final RegistrationsSetRegistrationUseCase? setRegistrationUseCase;
  final del.RegistrationsDeleteRegistrationUseCase? deleteRegistrationUseCase;
  final RegistrationsGetRegistrationsUseCase? getRegistrationsUseCase;
  StudentSubjectRegistrationBloc({required RegistrationsSetRegistrationUseCase? setRegistration,required del.RegistrationsDeleteRegistrationUseCase? deleteRegistration,required  RegistrationsGetRegistrationsUseCase? getRegistrations}) :setRegistrationUseCase=setRegistration,getRegistrationsUseCase=getRegistrations,deleteRegistrationUseCase=deleteRegistration, super(Empty());

  StudentSubjectRegistrationState get initial=>Empty();

  @override
  Stream<StudentSubjectRegistrationState> mapEventToState(StudentSubjectRegistrationEvent event) async* {

    if(event is RegisterStudentSubject){
      Failure? failure;
      yield Loading();
      try{
        final failureOrClassRoom= await setRegistrationUseCase!(Params(subjectId: event.subjectId!, studentId: event.studentId!));
        failureOrClassRoom.fold((l) => failure=l, (r) => null);
        print("map event to state called");
        yield* _eitherLoadedOrErrorState2(failureOrClassRoom);
      }catch(e){
        yield Error(message: _mapFailureToMessage(failure));
      }
    }else if(event is DeleteRegistration){
      Failure? failure;
      yield Loading();
      try{
        final failureOrClassRoom= await deleteRegistrationUseCase!(del.Params(registrationId: event.registrationId!));
        failureOrClassRoom.fold((l) => failure=l, (r) => null);
        print("map event to state called");
        yield* _eitherLoadedOrErrorState2(failureOrClassRoom);
      }catch(e){
        yield Error(message: _mapFailureToMessage(failure));
      }

    }else if(event is GetRegistrations){
      Failure? failure;
      yield Loading();
      try{
        final failureOrClassRoom= await getRegistrationsUseCase!(NoParams());
        failureOrClassRoom.fold((l) => failure=l, (r) => null);
        print("map event to state called");
        yield* _eitherLoadedOrErrorState(failureOrClassRoom);
      }catch(e){
        yield Error(message: _mapFailureToMessage(failure));
      }
    }

  }
  Stream<StudentSubjectRegistrationState> _eitherLoadedOrErrorState2(Either<Failure,int> failureOrTrivia,) async* {
    print("either loaded called");
    yield failureOrTrivia.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (result) => Deleted(code: result),
    );
  }

  Stream<StudentSubjectRegistrationState> _eitherLoadedOrErrorState(Either<Failure,RegistrationsDataModel> failureOrTrivia,) async* {
    print("either loaded called");
    yield failureOrTrivia.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (result) => Loaded(registrationsDataModel: result),
    );
  }


  String _mapFailureToMessage(Failure? failure) {

    print("map failure called");
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }

}
