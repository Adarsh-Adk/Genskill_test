import '../../../domain/entities/Registrations.dart';

abstract class RegistrationsRemoteDataSource{
  Future <RegistrationsDataModel> getRegistrations();
  Future <int>setRegistration(int subjectId,int studentId);
  Future <int>deleteRegistration(int registrationId);
}