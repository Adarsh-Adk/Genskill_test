import 'package:dartz/dartz.dart';
import '../../../../core/error/Failures.dart';
import '../../../../core/usecases/UseCase.dart';
import '../entities/Students.dart';
import '../repositories/StudentsRepository.dart';

class StudentsUseCase extends UseCase<StudentsDataModel,NoParams>{
  final StudentsRepository repository;

  StudentsUseCase(this.repository);

  Future<Either<Failure, StudentsDataModel>> call(NoParams params) async {
    return await repository.getStudents();
  }

}
