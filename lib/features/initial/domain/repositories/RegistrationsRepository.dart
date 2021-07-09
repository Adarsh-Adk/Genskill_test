import 'package:dartz/dartz.dart';
import '../../../../core/error/Failures.dart';
import '../entities/Registrations.dart';

abstract class RegistrationsRepository{
  Future<Either<Failure,RegistrationsDataModel>> getRegistrations();
  Future<Either<Failure,int>> setRegistration(int subjectId,int studentId);
  Future<Either<Failure,int>> deleteRegistration(int registrationId);
}