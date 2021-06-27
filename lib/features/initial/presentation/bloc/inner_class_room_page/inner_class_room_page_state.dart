part of 'inner_class_room_page_bloc.dart';

@immutable
abstract class InnerClassRoomPageState extends Equatable{

  @override
  List<Object> get props =>[];
}

class Empty extends InnerClassRoomPageState {}

class Loading extends InnerClassRoomPageState {}

class Loaded extends InnerClassRoomPageState {

  final ClassRoomDataModel classroom;

  Loaded({this.classroom, });

  @override
  List<Object> get props => [classroom];

}

class Error extends InnerClassRoomPageState {
  final String message;

  Error({this.message});

  @override
  List<Object> get props => [message];
}