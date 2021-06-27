import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/core/usecases/UseCase.dart';
import 'package:genskill_test/features/initial/domain/entities/ClassRoom.dart';
import 'package:genskill_test/features/initial/domain/usecases/ClassRoomUseCase.dart';
import 'package:meta/meta.dart';

part 'class_room_page_event.dart';
part 'class_room_page_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class ClassRoomPageBloc extends Bloc<ClassRoomPageEvent, ClassRoomPageState> {
  final ClassRoomUseCase getClassRoom;

  ClassRoomPageBloc({@required ClassRoomUseCase classrooms}) :assert(classrooms!=null),getClassRoom=classrooms ,super(Empty());

  ClassRoomPageState get initial=>Empty();

  @override
  Stream<ClassRoomPageState> mapEventToState(ClassRoomPageEvent event) async* {

    if(event is GetClassRoom){
      yield Loading();
      final failureOrStudents= await getClassRoom(NoParams());
      print("map event to state called");
      yield* _eitherLoadedOrErrorState(failureOrStudents);

    }

  }

  Stream<ClassRoomPageState> _eitherLoadedOrErrorState(
      Either<Failure, ClassRoomDataModel> failureOrTrivia,
      ) async* {
    print("either loaded called");
    yield failureOrTrivia.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (result) => Loaded(classroom: result),
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
