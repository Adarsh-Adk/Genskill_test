import 'package:dartz/dartz.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/features/initial/domain/entities/Subjects.dart';

abstract class SubjectsRepository{
  Future<Either<Failure,SubjectsDataModel>> getSubjects();
}