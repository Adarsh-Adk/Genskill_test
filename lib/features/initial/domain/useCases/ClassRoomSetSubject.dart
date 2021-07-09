import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/Failures.dart';
import '../../../../core/usecases/UseCase.dart';
import '../entities/ClassRoom.dart';
import '../repositories/ClassRoomRepository.dart';

class ClassRoomSetSubjectUseCase extends UseCase<ClassRoomDataModel,Params>{
  final ClassRoomRepository classRoomRepository;

  ClassRoomSetSubjectUseCase(this.classRoomRepository);


  Future<Either<Failure, ClassRoomDataModel>> call(Params params) async {
    return await classRoomRepository.setSubject(params.subjectId,params.classRoomId);
  }


}
class Params extends Equatable {
  final int subjectId;
  final int classRoomId;

  Params({required this.subjectId,required this.classRoomId,});

  @override
  List<Object> get props => [];
}
