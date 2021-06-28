import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/core/usecases/UseCase.dart';
import 'package:genskill_test/features/initial/domain/entities/ClassRoom.dart';
import 'package:genskill_test/features/initial/domain/repositories/ClassRoomRepository.dart';

class ClassRoomGetClassRoomUseCase extends UseCase<ClassRoomDataModel,Params>{
  final ClassRoomRepository classRoomRepository;

  ClassRoomGetClassRoomUseCase(this.classRoomRepository);


  Future<Either<Failure, ClassRoomDataModel>> call(Params params) async {
    return await classRoomRepository.getClassRoom(params.id);
  }


}
class Params extends Equatable {
  final int id;

  Params({@required this.id});

  @override
  List<Object> get props => [id];
}

