

import 'package:dartz/dartz.dart';
import '../../../../core/error/Failures.dart';
import '../../../../core/usecases/UseCase.dart';
import '../entities/ClassRoom.dart';
import '../repositories/ClassRoomRepository.dart';

class ClassRoomGetClassRoomsUseCase extends UseCase<ClassRoomsDataModel,NoParams>{
  final ClassRoomRepository classRoomRepository;

  ClassRoomGetClassRoomsUseCase(this.classRoomRepository);

  Future<Either<Failure, ClassRoomsDataModel>> call(NoParams params) async {
    return await classRoomRepository.getClassRooms();
  }


}