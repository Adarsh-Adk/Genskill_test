part of 'class_room_page_bloc.dart';

@immutable
abstract class ClassRoomPageState extends Equatable{

  @override
  List<Object?> get props =>[];
}

class Empty extends ClassRoomPageState {}

class Loading extends ClassRoomPageState {}

class Loaded extends ClassRoomPageState {
  final ClassRoomsDataModel? classrooms;
  final ClassRoomDataModel? classroom;

  Loaded({this.classrooms,this.classroom, });

  @override
  List<Object?> get props => [classrooms];

}

class Error extends ClassRoomPageState {
  final String? message;

  Error({this.message});

  @override
  List<Object?> get props => [message];
}