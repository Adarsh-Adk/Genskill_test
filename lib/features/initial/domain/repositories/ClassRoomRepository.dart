
import 'package:dartz/dartz.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/features/initial/domain/entities/ClassRoom.dart';

abstract class ClassRoomRepository{
  Future<Either<Failure,ClassRoomsDataModel>> getClassRooms();

  Future<Either<Failure,ClassRoomDataModel>> getClassRoom(int id);

  Future<Either<Failure,ClassRoomDataModel>> setSubject(int subjectId,int classRoomId);
}