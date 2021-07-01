import 'package:dartz/dartz.dart';
import 'package:genskill_test/core/error/Exception.dart';
import 'package:genskill_test/core/error/Failures.dart';
import 'package:genskill_test/features/initial/data/datasources/Registrations/RegistrationsRemoteDataSource.dart';
import 'package:genskill_test/features/initial/data/datasources/Students/StudentsRemoteDataSource.dart';
import 'package:genskill_test/features/initial/data/datasources/Subjects/SubjectsRemoteDataSource.dart';
import 'package:genskill_test/features/initial/domain/entities/Registrations.dart';
import 'package:genskill_test/features/initial/domain/repositories/RegistrationsRepository.dart';
import 'package:meta/meta.dart';

class RegistrationsRepositoryImpl implements RegistrationsRepository{

  final RegistrationsRemoteDataSource remoteDataSource;
  final SubjectsRemoteDataSource subjectsRemoteDataSource;
  final StudentsRemoteDataSource studentsRemoteDataSource;

  RegistrationsRepositoryImpl({@required this.remoteDataSource,@required this.subjectsRemoteDataSource,@required this.studentsRemoteDataSource});

  @override
  Future<Either<Failure, RegistrationsDataModel>> getRegistrations() async{
    try{
      final data=await remoteDataSource.getRegistrations();
      List<Registration> list=[];

      if(data.registrations.isNotEmpty){
        for(int i=0;i<data.registrations.length;i++){
          int subject=int.parse(data.registrations[i].subject);
          final subName=await subjectsRemoteDataSource.getSubject(subject);
          int student=int.parse(data.registrations[i].student);
          final studentName=await studentsRemoteDataSource.getStudent(student);
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