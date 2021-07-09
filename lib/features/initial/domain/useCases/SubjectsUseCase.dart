import 'package:dartz/dartz.dart';
import '../../../../core/error/Failures.dart';
import '../../../../core/usecases/UseCase.dart';
import '../entities/Subjects.dart';
import '../repositories/SubjectsRepository.dart';

class SubjectsUseCase extends UseCase<SubjectsDataModel,NoParams>{
  final SubjectsRepository repository;

  SubjectsUseCase(this.repository);

  Future<Either<Failure, SubjectsDataModel>> call(NoParams params) async {
    return await repository.getSubjects();
  }

}