import 'package:genskill_test/features/initial/domain/entities/Students.dart';

abstract class StudentsDataRemoteDataSource{
  Future <StudentsDataModel> getStudents();
}