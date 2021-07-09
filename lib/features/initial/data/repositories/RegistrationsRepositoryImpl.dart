import 'package:dartz/dartz.dart';
import '../../../../core/error/Exception.dart';
import '../../../../core/error/Failures.dart';
import '../datasources/Registrations/RegistrationsRemoteDataSource.dart';
import '../datasources/Students/StudentsRemoteDataSource.dart';
import '../datasources/Subjects/SubjectsRemoteDataSource.dart';
import '../../domain/entities/Registrations.dart';
import '../../domain/repositories/RegistrationsRepository.dart';

class RegistrationsRepositoryImpl implements RegistrationsRepository{

  final RegistrationsRemoteDataSource? remoteDataSource;
  final SubjectsRemoteDataSource? subjectsRemoteDataSource;
  final StudentsRemoteDataSource? studentsRemoteDataSource;

  RegistrationsRepositoryImpl({required this.remoteDataSource,required this.subjectsRemoteDataSource,required this.studentsRemoteDataSource});

  @override
  Future<Either<Failure, RegistrationsDataModel>> getRegistrations() async{
    try{
      final data=await remoteDataSource!.getRegistrations();
      List<Registration> list=[];

      if(data.registrations.isNotEmpty){
        for(int i=0;i<data.registrations.length;i++){
          int subject=int.parse(data.registrations[i].subject!);
          final subName=await subjectsRemoteDataSource!.getSubject(subject);
          int student=int.parse(data.registrations[i].student!);
          final studentName=await studentsRemoteDataSource!.getStudent(student);
          Registration registration=Registration(id: data.registrations[i].id, student: studentName.name, subject: subName.name);
          list.add(registration);
        }
        RegistrationsDataModel finalModel=RegistrationsDataModel(registrations:list );
        print("registrations right called");
        return Right(finalModel);
      }else{
        print("registrations right called");
        return Right(data);
      }



    }on ServerException{
      print("registrations left called");
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, int>> setRegistration(int subjectId,int studentId) async{
    try{
      final data=await remoteDataSource!.setRegistration(subjectId, studentId);
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
      final data=await remoteDataSource!.deleteRegistration(registrationId);
      print("right was called");
      return Right(data);

    }on ServerException{
      print("left was called");
      return Left(ServerFailure());
    }
  }

}