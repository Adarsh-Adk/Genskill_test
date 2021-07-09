import 'package:dartz/dartz.dart';
import '../../../../core/error/Failures.dart';
import '../entities/Students.dart';

abstract class StudentsRepository{
  Future<Either<Failure,StudentsDataModel>> getStudents();
}