import 'package:dartz/dartz.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/features/initial/domain/entities/Students.dart';

abstract class StudentsRepository{
  Future<Either<Failure,StudentsDataModel>> getStudents();
}