
import 'package:genskill_test/features/initial/domain/entities/ClassRoom.dart';

abstract class ClassRoomRemoteDataSource{
  Future <ClassRoomsDataModel> getClassRooms();

  Future <ClassRoomDataModel> getClassRoom(int id);

  Future <ClassRoomDataModel> setSubject(int subjectId,int classRoomId);
}
