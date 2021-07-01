import 'package:genskill_test/features/initial/domain/entities/Students.dart';

abstract class StudentsRemoteDataSource{
  Future <StudentsDataModel> getStudents();
  Future <Student> getStudent(int id);
}