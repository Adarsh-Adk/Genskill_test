import 'package:dartz/dartz.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/core/usecases/UseCase.dart';
import 'package:genskill_test/features/initial/domain/entities/Students.dart';
import 'package:genskill_test/features/initial/domain/repositories/StudentsRepository.dart';

class GetStudents extends UseCase<StudentsDataModel,NoParams>{
  final StudentsRepository repository;

  GetStudents(this.repository);

  Future<Either<Failure, StudentsDataModel>> call(NoParams params) async {
    return await repository.getStudents();
  }

}
