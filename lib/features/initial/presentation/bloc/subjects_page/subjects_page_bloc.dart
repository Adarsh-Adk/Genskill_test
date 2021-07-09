import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/Failures.dart';
import '../../../../../core/usecases/UseCase.dart';
import '../../../domain/entities/Subjects.dart';
import '../../../domain/usecases/SubjectsUseCase.dart';
import 'package:meta/meta.dart';

part 'subjects_page_event.dart';
part 'subjects_page_state.dart';
const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class SubjectsPageBloc extends Bloc<SubjectsPageEvent, SubjectsPageState> {
  final SubjectsUseCase getSubject;
  SubjectsPageBloc({required SubjectsUseCase subject}) :getSubject=subject, super(Empty());

  SubjectsPageState get initialState=> Empty();

  @override
  Stream<SubjectsPageState> mapEventToState(SubjectsPageEvent event) async* {
    if(event is GetSubject){
      Failure? failure;
      yield Loading();
      try{
        final failureOrSubjects= await getSubject(NoParams());
        failureOrSubjects.fold((l) => failure=l, (r) => null);
        print("map event to state called");
        yield* _eitherLoadedOrErrorSubjectState(failureOrSubjects);
      }catch(e){
        Error(message: _mapFailureToMessage(failure));
      }

    }
  }
  Stream<SubjectsPageState> _eitherLoadedOrErrorSubjectState(
      Either<Failure, SubjectsDataModel> failureOrTrivia,
      ) async* {
    print("either loaded called");
    yield failureOrTrivia.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (result) => Loaded(subjectsDataModel: result),
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
