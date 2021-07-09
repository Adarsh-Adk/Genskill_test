import '../../../domain/entities/Subjects.dart';

abstract class SubjectsRemoteDataSource{
  Future <SubjectsDataModel> getSubjects();

  Future<Subject> getSubject(int id);
}