import 'package:dartz/dartz.dart';
import 'package:genskill_test/core/error/Exception.dart';
import 'package:meta/meta.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/features/initial/data/datasources/Students/StudentsDataRemoteSource.dart';
import 'package:genskill_test/features/initial/domain/entities/Students.dart';
import 'package:genskill_test/features/initial/domain/repositories/StudentsRepository.dart';

class StudentsRepositoryImpl implements StudentsRepository{

  final StudentsDataRemoteDataSource remoteDataSource;

  StudentsRepositoryImpl({@required this.remoteDataSource});

  @override
  Future<Either<Failure, StudentsDataModel>> getStudents() async{
    try{
      final data=await remoteDataSource.getStudents();
      return Right(data);

    }on ServerException{

      return Left(ServerFailure());
    }
  }

}