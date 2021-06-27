part of 'inner_class_room_page_bloc.dart';


@immutable
abstract class InnerClassRoomPageEvent extends Equatable{

  @override
  List<Object> get props =>[];
}

class GetClassRoom extends InnerClassRoomPageEvent{
  final int id;

  GetClassRoom({@required this.id});
}