import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/core/usecases/UseCase.dart';
import 'package:genskill_test/features/initial/domain/entities/Students.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:genskill_test/features/initial/domain/usecases/StudentsUseCase.dart';

part 'StudentsPageEvent.dart';
part 'StudentsPageState.dart';


const String SERVER_FAILURE_MESSAGE = 'Server Failure';


class StudentsPageBloc extends Bloc<StudentsPageEvent, StudentsPageState> {

  final StudentsUseCase getStudent;

  StudentsPageBloc( {@required StudentsUseCase student}) : assert(student!=null),getStudent=student, super(Empty());

  StudentsPageState get initialState=> Empty();

  @override
  Stream<StudentsPageState> mapEventToState(
    StudentsPageEvent event,
  ) async* {
    if(event is GetStudent){
      yield Loading();
      final failureOrStudents= await getStudent(NoParams());
      print("map event to state called");
      yield* _eitherLoadedOrErrorState(failureOrStudents);

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
  String _mapFailureToMessage(Failure failure) {
    print("map failure called");
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
