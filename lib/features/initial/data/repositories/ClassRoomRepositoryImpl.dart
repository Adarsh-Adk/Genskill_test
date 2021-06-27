import 'package:dartz/dartz.dart';
import 'package:genskill_test/core/error/Exception.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/features/initial/data/datasources/ClassRoom/ClassRoomRemoteDataSource.dart';
import 'package:genskill_test/features/initial/domain/entities/ClassRoom.dart';
import 'package:genskill_test/features/initial/domain/repositories/ClassRoomRepository.dart';
import 'package:meta/meta.dart';

class ClassRoomRepositoryImpl implements ClassRoomRepository{

  final ClassRoomRemoteDataSource remoteDataSource;

  ClassRoomRepositoryImpl({@required this.remoteDataSource});

  @override
  Future<Either<Failure, ClassRoomDataModel>> getClassRooms() async{
    try{
      final data=await remoteDataSource.getClassRooms();
      return Right(data);

    }on ServerException{

      return Left(ServerFailure());
    }
  }

}