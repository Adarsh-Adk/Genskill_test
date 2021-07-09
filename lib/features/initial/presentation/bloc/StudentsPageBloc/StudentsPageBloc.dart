import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/Failures.dart';
import '../../../../../core/usecases/UseCase.dart';
import '../../../domain/entities/Students.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/usecases/StudentsUseCase.dart';

part 'StudentsPageEvent.dart';
part 'StudentsPageState.dart';


const String SERVER_FAILURE_MESSAGE = 'Server Failure';


class StudentsPageBloc extends Bloc<StudentsPageEvent, StudentsPageState> {

  final StudentsUseCase getStudent;

  StudentsPageBloc( {required StudentsUseCase student}) : getStudent=student, super(Empty());

  StudentsPageState get initialState=> Empty();

  @override
  Stream<StudentsPageState> mapEventToState(
    StudentsPageEvent event,
  ) async* {
    if(event is GetStudent){
      Failure? failure;
      yield Loading();
      try{
        final failureOrStudents= await getStudent(NoParams());
        failureOrStudents.fold((l) => failure=l, (r) => null);
        print("map event to state called");
        yield* _eitherLoadedOrErrorState(failureOrStudents);
      }catch(e){
        Error(message: _mapFailureToMessage(failure));
      }


    }
  }

  Stream<StudentsPageState> _eitherLoadedOrErrorState(
      Either<Failure, StudentsDataModel> failureOrTrivia,
      ) async* {
    print("either loaded called");
    yield failureOrTrivia.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (result) => Loaded(studentsDataModel: result),
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
