import 'package:dartz/dartz.dart';
import 'package:genskill_test/core/error/Exception.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/features/initial/data/datasources/Registrations/RegistrationsRemoteDataSource.dart';
import 'package:genskill_test/features/initial/domain/entities/Registrations.dart';
import 'package:genskill_test/features/initial/domain/repositories/RegistrationsRepository.dart';
import 'package:meta/meta.dart';

class RegistrationsRepositoryImpl implements RegistrationsRepository{

  final RegistrationsRemoteDataSource remoteDataSource;

  RegistrationsRepositoryImpl({@required this.remoteDataSource});

  @override
  Future<Either<Failure, RegistrationsDataModel>> getRegistrations() async{
    try{
      final data=await remoteDataSource.getRegistrations();
      return Right(data);

    }on ServerException{

      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, int>> setRegistration(int subjectId,int studentId) async{
    try{
      final data=await remoteDataSource.setRegistration(subjectId, studentId);
      print("right was called");
     return Right(data);

    }on ServerException{
      print("left was called");
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, int>> deleteRegistration(int registrationId) async{
    try{
      final data=await remoteDataSource.deleteRegistration(registrationId);
      print("right was called");
      return Right(data);

    }on ServerException{
      print("left was called");
      return Left(ServerFailure());
    }
  }

}