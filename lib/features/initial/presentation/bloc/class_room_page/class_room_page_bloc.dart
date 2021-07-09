import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/Failures.dart';
import '../../../../../core/usecases/UseCase.dart';
import '../../../domain/entities/ClassRoom.dart';
import '../../../domain/usecases/ClassRoomGetClassRoomsUseCase.dart';
import 'package:meta/meta.dart';

part 'class_room_page_event.dart';
part 'class_room_page_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class ClassRoomPageBloc extends Bloc<ClassRoomPageEvent, ClassRoomPageState> {
  final ClassRoomGetClassRoomsUseCase getClassRooms;


  ClassRoomPageBloc({required ClassRoomGetClassRoomsUseCase classrooms,}) :getClassRooms=classrooms ,super(Empty());

  ClassRoomPageState get initial=>Empty();

  @override
  Stream<ClassRoomPageState> mapEventToState(ClassRoomPageEvent event) async* {

    if(event is GetClassRooms){
      Failure? failure;

      yield Loading();
      try{
        final Either<Failure, ClassRoomsDataModel> failureOrClassRooms = await getClassRooms(NoParams());
        failureOrClassRooms.fold((l) => failure=l, (r) => null);
        print(failureOrClassRooms.runtimeType);
        yield* _eitherLoadedOrErrorState(failureOrClassRooms);
      }
      catch(e){
        yield Error(message: _mapFailureToMessage(failure));
      }
    }

  }

  Stream<ClassRoomPageState> _eitherLoadedOrErrorState(
      Either<Failure, ClassRoomsDataModel> failureOrTrivia,
      ) async* {
    print("either loaded called");
    yield failureOrTrivia.fold(
          (failure) {
            print("failure was called");
            return Error(message: _mapFailureToMessage(failure));},
          (result) {
            print("result was called");
          return  Loaded(classrooms: result);},
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
