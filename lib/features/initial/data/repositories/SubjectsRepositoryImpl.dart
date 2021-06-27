import 'package:dartz/dartz.dart';
import 'package:genskill_test/core/error/Exception.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/features/initial/data/datasources/Subjects/SubjectsRemoteDataSource.dart';
import 'package:genskill_test/features/initial/domain/entities/Subjects.dart';
import 'package:genskill_test/features/initial/domain/repositories/SubjectsRepository.dart';
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