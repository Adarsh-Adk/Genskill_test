import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/Failures.dart';
import '../../../domain/entities/ClassRoom.dart';
import '../../../domain/usecases/ClassRoomGetClassRoomUseCase.dart';
import '../../../domain/usecases/ClassRoomSetSubject.dart' as Set;
import 'package:meta/meta.dart';

part 'inner_class_room_page_event.dart';

part 'inner_class_room_page_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class InnerClassRoomPageBloc extends Bloc<InnerClassRoomPageEvent, InnerClassRoomPageState> {

  final ClassRoomGetClassRoomUseCase getClassRoom;
  final Set.ClassRoomSetSubjectUseCase? setSubjectUseCase;

  InnerClassRoomPageBloc({required ClassRoomGetClassRoomUseCase classRoom,required Set.ClassRoomSetSubjectUseCase? setSubject}) :getClassRoom=classRoom,setSubjectUseCase=setSubject ,super(Empty());

  InnerClassRoomPageState get initial=>Empty();

  @override
  Stream<InnerClassRoomPageState> mapEventToState(InnerClassRoomPageEvent event) async* {

     if(event is GetClassRoom){
       Failure? failure;
      yield Loading();
      try{
        final failureOrClassRoom= await getClassRoom(Params(id:event.id!));
        failureOrClassRoom.fold((l) => failure=l, (r) => null);
        print("map event to state called");
        yield* _eitherLoadedOrErrorState2(failureOrClassRoom);
      }catch(e){
        yield Error(message: _mapFailureToMessage(failure));
      }

    }else if(event is SetSubject){
       Failure? failure;
       yield Loading();
       try{
         final failureOrClassRoom= await setSubjectUseCase!(Set.Params(classRoomId:event.classRoomId! ,subjectId:event.subjectId! ));
         failureOrClassRoom.fold((l) => failure=l, (r) => null);
         print("map event to state called");
         yield* _eitherLoadedOrErrorState2(failureOrClassRoom);
       }catch(e){
         yield Error(message: _mapFailureToMessage(failure));
       }

     }

  }

  Stream<InnerClassRoomPageState> _eitherLoadedOrErrorState2(Either<Failure, ClassRoomDataModel> failureOrTrivia,) async* {
    print("either loaded called");
    yield failureOrTrivia.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (result) => Loaded(classroom: result),
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
