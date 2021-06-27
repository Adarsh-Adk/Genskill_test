
import 'package:genskill_test/features/initial/domain/entities/ClassRoom.dart';

abstract class ClassRoomRemoteDataSource{
  Future <ClassRoomDataModel> getClassRooms();
}