import 'package:dartz/dartz.dart';
import '../../../../core/error/Failures.dart';
import '../entities/Subjects.dart';

abstract class SubjectsRepository{
  Future<Either<Failure,SubjectsDataModel>> getSubjects();
}