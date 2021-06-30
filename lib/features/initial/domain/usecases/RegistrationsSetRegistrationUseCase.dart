import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/core/usecases/UseCase.dart';
import 'package:genskill_test/features/initial/domain/repositories/RegistrationsRepository.dart';
import 'package:meta/meta.dart';


class RegistrationsSetRegistrationUseCase extends UseCase<int,Params>{
  final RegistrationsRepository repository;

  RegistrationsSetRegistrationUseCase(this.repository);

  Future<Either<Failure, int>> call(Params params) async {
    return await repository.setRegistration(params.subjectId,params.studentId);
  }

}

class Params extends Equatable {
  final int subjectId;
  final int studentId;

  Params({@required this.subjectId,@required this.studentId,});

  @override
  List<Object> get props => [];
}
