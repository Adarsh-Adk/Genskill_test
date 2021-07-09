import 'package:dartz/dartz.dart';
import '../../../../core/error/Failures.dart';
import '../../../../core/usecases/UseCase.dart';
import '../entities/Registrations.dart';
import '../repositories/RegistrationsRepository.dart';

class RegistrationsGetRegistrationsUseCase extends UseCase<RegistrationsDataModel,NoParams>{
  final RegistrationsRepository repository;

  RegistrationsGetRegistrationsUseCase(this.repository);

  Future<Either<Failure, RegistrationsDataModel>> call(NoParams params) async {
    return await repository.getRegistrations();
  }

}