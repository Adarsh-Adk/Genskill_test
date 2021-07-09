import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/Failures.dart';
import '../../../../core/usecases/UseCase.dart';
import '../repositories/RegistrationsRepository.dart';


class RegistrationsDeleteRegistrationUseCase extends UseCase<int,Params>{
  final RegistrationsRepository repository;

  RegistrationsDeleteRegistrationUseCase(this.repository);

  Future<Either<Failure, int>> call(Params params) async {
    return await repository.deleteRegistration(params.registrationId);
  }

}

class Params extends Equatable {
  final int registrationId;


  Params({required this.registrationId,});

  @override
  List<Object> get props => [];
}