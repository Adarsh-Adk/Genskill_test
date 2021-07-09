import 'package:dartz/dartz.dart';
import '../../../../core/error/Exception.dart';
import '../../../../core/error/Failures.dart';
import '../datasources/ClassRoom/ClassRoomRemoteDataSource.dart';
import '../datasources/Subjects/SubjectsRemoteDataSource.dart';
import '../../domain/entities/ClassRoom.dart';
import '../../domain/repositories/ClassRoomRepository.dart';

class ClassRoomRepositoryImpl implements ClassRoomRepository{

  final ClassRoomRemoteDataSource? remoteDataSource;
  final SubjectsRemoteDataSource? subjectsRemoteDataSource;

  ClassRoomRepositoryImpl({required this.subjectsRemoteDataSource,required this.remoteDataSource});

  @override
  Future<Either<Failure, ClassRoomsDataModel>> getClassRooms() async{
    try{
      final data=await remoteDataSource!.getClassRooms();
      return Right<Failure,ClassRoomsDataModel>(data);

    }on ServerException{

      return Left<Failure,ClassRoomsDataModel>(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ClassRoomDataModel>> getClassRoom(int id) async{
    try{
      final data=await remoteDataSource!.getClassRoom(id);
      if(data.subject!=""){
        int subject=int.parse(data.subject!);
        final subName=await subjectsRemoteDataSource!.getSubject(subject);
        print("right was called");
        ClassRoomDataModel classRoomDataModel=ClassRoomDataModel(id: data.id, layout: data.layout, name: data.name, size: data.size, subject: subName.name, subjectId: '${data.subject}');
        return Right(classRoomDataModel);
      }else {
        return Right(data);
      }

    }on ServerException{
      print("left was called");
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ClassRoomDataModel>> setSubject(int subjectId,int classRoomId)async {
    try{
      final data=await remoteDataSource!.setSubject(subjectId, classRoomId);
      if(data.subject!=""){
        int subject=int.parse(data.subject!);
        final subName=await subjectsRemoteDataSource!.getSubject(subject);
        print("right was called");
        ClassRoomDataModel classRoomDataModel=ClassRoomDataModel(id: data.id, layout: data.layout, name: data.name, size: data.size, subject: subName.name, subjectId: '${data.subject}');
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