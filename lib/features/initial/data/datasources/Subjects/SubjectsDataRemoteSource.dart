import 'package:genskill_test/features/initial/domain/entities/Subjects.dart';

abstract class SubjectsDataRemoteDataSource{
  Future <SubjectsDataModel> getSubjects();
}