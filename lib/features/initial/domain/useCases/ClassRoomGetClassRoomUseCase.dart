import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/Failures.dart';
import '../../../../core/usecases/UseCase.dart';
import '../entities/ClassRoom.dart';
import '../repositories/ClassRoomRepository.dart';

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

