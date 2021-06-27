

import 'package:dartz/dartz.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/core/usecases/UseCase.dart';
import 'package:genskill_test/features/initial/domain/entities/ClassRoom.dart';
import 'package:genskill_test/features/initial/domain/repositories/ClassRoomRepository.dart';

class ClassRoomUseCase extends UseCase<ClassRoomDataModel,NoParams>{
  final ClassRoomRepository classRoomRepository;

  ClassRoomUseCase(this.classRoomRepository);

  Future<Either<Failure, ClassRoomDataModel>> call(NoParams params) async {
    return await classRoomRepository.getClassRooms();
  }

}