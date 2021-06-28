import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/core/usecases/UseCase.dart';
import 'package:meta/meta.dart';
import 'package:genskill_test/features/initial/domain/entities/ClassRoom.dart';
import 'package:genskill_test/features/initial/domain/repositories/ClassRoomRepository.dart';

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

  Params({@required this.subjectId,@required this.classRoomId,});

  @override
  List<Object> get props => [];
}
