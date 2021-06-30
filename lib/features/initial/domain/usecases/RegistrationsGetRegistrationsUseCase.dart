import 'package:dartz/dartz.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/core/usecases/UseCase.dart';
import 'package:genskill_test/features/initial/domain/entities/Registrations.dart';
import 'package:genskill_test/features/initial/domain/repositories/RegistrationsRepository.dart';

class RegistrationsGetRegistrationsUseCase extends UseCase<RegistrationsDataModel,NoParams>{
  final RegistrationsRepository repository;

  RegistrationsGetRegistrationsUseCase(this.repository);

  Future<Either<Failure, RegistrationsDataModel>> call(NoParams params) async {
    return await repository.getRegistrations();
  }

}