import 'package:dartz/dartz.dart';
import 'package:genskill_test/core/error/Exception.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/features/initial/data/datasources/ClassRoom/ClassRoomRemoteDataSource.dart';
import 'package:genskill_test/features/initial/data/datasources/Subjects/SubjectsRemoteDataSource.dart';
import 'package:genskill_test/features/initial/domain/entities/ClassRoom.dart';
import 'package:genskill_test/features/initial/domain/repositories/ClassRoomRepository.dart';
import 'package:meta/meta.dart';

class ClassRoomRepositoryImpl implements ClassRoomRepository{

  final ClassRoomRemoteDataSource remoteDataSource;
  final SubjectsRemoteDataSource subjectsRemoteDataSource;

  ClassRoomRepositoryImpl({@required this.subjectsRemoteDataSource,@required this.remoteDataSource});

  @override
  Future<Either<Failure, ClassRoomsDataModel>> getClassRooms() async{
    try{
      final data=await remoteDataSource.getClassRooms();
      return Right<Failure,ClassRoomsDataModel>(data);

    }on ServerException{

      return Left<Failure,ClassRoomsDataModel>(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ClassRoomDataModel>> getClassRoom(int id) async{
    try{
      final data=await remoteDataSource.getClassRoom(id);
      if(data.subject!=""){
        int subject=int.parse(data.subject);
        final subName=await subjectsRemoteDataSource.getSubject(subject);
        print("right was called");
        ClassRoomDataModel classRoomDataModel=ClassRoomDataModel(id: data.id, layout: data.layout, name: data.name, size: data.size, subject: subName.name);
        return Right(classRoomDataModel);
      }else {
        return Right(data);
      }

    }on ServerException{
      print("left was called");
      return Left(ServerFailure());
    }
  }

}