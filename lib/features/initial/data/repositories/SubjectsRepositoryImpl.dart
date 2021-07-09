import 'package:dartz/dartz.dart';
import '../../../../core/error/Exception.dart';
import '../../../../core/error/Failures.dart';
import '../datasources/Subjects/SubjectsRemoteDataSource.dart';
import '../../domain/entities/Subjects.dart';
import '../../domain/repositories/SubjectsRepository.dart';
import 'package:meta/meta.dart';
class SubjectsRepositoryImpl implements SubjectsRepository{

  final SubjectsRemoteDataSource remoteDataSource;

  SubjectsRepositoryImpl({@required this.remoteDataSource});

  @override
  Future<Either<Failure, SubjectsDataModel>> getSubjects() async{
    print("repository called");
    try{
      final data=await remoteDataSource.getSubjects();

      return Right(data);

    }on ServerException{

      return Left(ServerFailure());
    }
  }

}