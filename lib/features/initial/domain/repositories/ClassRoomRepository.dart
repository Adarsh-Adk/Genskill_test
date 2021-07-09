
import 'package:dartz/dartz.dart';
import '../../../../core/error/Failures.dart';
import '../entities/ClassRoom.dart';

abstract class ClassRoomRepository{
  Future<Either<Failure,ClassRoomsDataModel>> getClassRooms();

  Future<Either<Failure,ClassRoomDataModel>> getClassRoom(int id);

  Future<Either<Failure,ClassRoomDataModel>> setSubject(int subjectId,int classRoomId);
}