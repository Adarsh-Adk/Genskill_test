

import 'package:dartz/dartz.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/core/usecases/UseCase.dart';
import 'package:genskill_test/features/initial/domain/entities/ClassRoom.dart';
import 'package:genskill_test/features/initial/domain/repositories/ClassRoomRepository.dart';

class ClassRoomGetClassRooms extends UseCase<ClassRoomsDataModel,NoParams>{
  final ClassRoomRepository classRoomRepository;

  ClassRoomGetClassRooms(this.classRoomRepository);

  Future<Either<Failure, ClassRoomsDataModel>> call(NoParams params) async {
    return await classRoomRepository.getClassRooms();
  }


}