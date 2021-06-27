import 'package:dartz/dartz.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/core/usecases/UseCase.dart';
import 'package:genskill_test/features/initial/domain/entities/Subjects.dart';
import 'package:genskill_test/features/initial/domain/repositories/SubjectsRepository.dart';

class SubjectsUseCase extends UseCase<SubjectsDataModel,NoParams>{
  final SubjectsRepository repository;

  SubjectsUseCase(this.repository);

  Future<Either<Failure, SubjectsDataModel>> call(NoParams params) async {
    return await repository.getSubjects();
  }

}