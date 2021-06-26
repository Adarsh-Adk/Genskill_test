import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/core/usecases/UseCase.dart';
import 'package:genskill_test/features/initial/domain/entities/Subjects.dart';
import 'package:genskill_test/features/initial/domain/usecases/GetSubjects.dart';
import 'package:meta/meta.dart';

part 'subjects_page_event.dart';
part 'subjects_page_state.dart';
const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class SubjectsPageBloc extends Bloc<SubjectsPageEvent, SubjectsPageState> {
  final GetSubjects getSubject;
  SubjectsPageBloc({@required GetSubjects subject}) :assert(subject!=null),getSubject=subject, super(Empty());

  SubjectsPageState get initialState=> Empty();

  @override
  Stream<SubjectsPageState> mapEventToState(SubjectsPageEvent event) async* {
    if(event is GetSubject){
      yield Loading();
      final failureOrSubjects= await getSubject(NoParams());
      print("map event to state called");
      yield* _eitherLoadedOrErrorSubjectState(failureOrSubjects);

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
