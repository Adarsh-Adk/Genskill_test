
import 'package:dartz/dartz.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/features/initial/domain/entities/ClassRoom.dart';

abstract class ClassRoomRepository{
  Future<Either<Failure,ClassRoomDataModel>> getClassRooms();
}