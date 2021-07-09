import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/Failures.dart';
import '../../../../core/usecases/UseCase.dart';
import '../repositories/RegistrationsRepository.dart';


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

  Params({required this.subjectId,required this.studentId,});

  @override
  List<Object> get props => [];
}
