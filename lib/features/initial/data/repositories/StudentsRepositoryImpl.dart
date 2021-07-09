import 'package:dartz/dartz.dart';
import '../../../../core/error/Exception.dart';
import 'package:meta/meta.dart';
import '../../../../core/error/Failures.dart';
import '../datasources/Students/StudentsRemoteDataSource.dart';
import '../../domain/entities/Students.dart';
import '../../domain/repositories/StudentsRepository.dart';

class StudentsRepositoryImpl implements StudentsRepository{

  final StudentsRemoteDataSource remoteDataSource;

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