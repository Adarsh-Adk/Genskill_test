import 'features/initial/data/datasources/ClassRoom/ClassRoomRemoteDataSource.dart';
import 'features/initial/data/datasources/ClassRoom/ClassRoomRemoteDataSourceImpl.dart';
import 'features/initial/data/datasources/Registrations/RegistrationsRemoteDataSource.dart';
import 'features/initial/data/datasources/Students/StudentsRemoteDataSource.dart';
import 'features/initial/data/datasources/Students/StudentsRemoteDataSourceImpl.dart';
import 'features/initial/data/repositories/ClassRoomRepositoryImpl.dart';
import 'features/initial/data/repositories/StudentsRepositoryImpl.dart';
import 'features/initial/domain/repositories/ClassRoomRepository.dart';
import 'features/initial/domain/repositories/StudentsRepository.dart';
import 'features/initial/domain/repositories/SubjectsRepository.dart';
import 'features/initial/domain/usecases/ClassRoomGetClassRoomsUseCase.dart';
import 'features/initial/domain/usecases/ClassRoomSetSubject.dart';
import 'features/initial/domain/usecases/RegistrationsGetRegistrationsUseCase.dart';
import 'features/initial/domain/usecases/StudentsUseCase.dart';
import 'features/initial/domain/usecases/SubjectsUseCase.dart';
import 'features/initial/presentation/bloc/StudentsPageBloc/StudentsPageBloc.dart';
import 'features/initial/presentation/bloc/class_room_page/class_room_page_bloc.dart';
import 'features/initial/presentation/bloc/inner_class_room_page/inner_class_room_page_bloc.dart';
import 'features/initial/presentation/bloc/registration_page/registration_page_bloc.dart';
import 'features/initial/presentation/bloc/student_subject_registration/student_subject_registration_bloc.dart';
import 'features/initial/presentation/bloc/subjects_page/subjects_page_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'features/initial/data/datasources/Registrations/RegistrationsRemoteDataSourceImpl.dart';
import 'features/initial/data/datasources/Subjects/SubjectsRemoteDataSource.dart';
import 'features/initial/data/datasources/Subjects/SubjectsRemoteDataSourceImpl.dart';
import 'features/initial/data/repositories/RegistrationsRepositoryImpl.dart';
import 'features/initial/data/repositories/SubjectsRepositoryImpl.dart';
import 'features/initial/domain/repositories/RegistrationsRepository.dart';
import 'features/initial/domain/usecases/ClassRoomGetClassRoomUseCase.dart';
import 'features/initial/domain/usecases/RegistrationsDeleteRegistrationUseCase.dart';
import 'features/initial/domain/usecases/RegistrationsSetRegistrationUseCase.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerFactory(
    () => RegistrationPageBloc(
      setRegistration: sl(),
      getRegistrations: sl(),
      deleteRegistration: sl(),
    ),
  );
  sl.registerFactory(() => StudentsPageBloc(student: sl()));
  sl.registerFactory(() => SubjectsPageBloc(subject: sl()));
  sl.registerFactory(() => ClassRoomPageBloc(classrooms: sl()));
  sl.registerFactory(() => InnerClassRoomPageBloc(classRoom: sl(), setSubject: sl()));
  sl.registerFactory(() => StudentSubjectRegistrationBloc(
      setRegistration: sl(),
      getRegistrations: sl(),
      deleteRegistration: sl()));
  sl.registerLazySingleton(() => StudentsUseCase(sl()));
  sl.registerLazySingleton(() => SubjectsUseCase(sl()));
  sl.registerLazySingleton(() => ClassRoomGetClassRoomsUseCase(sl()));
  sl.registerLazySingleton(() => ClassRoomGetClassRoomUseCase(sl()));
  sl.registerLazySingleton(() => ClassRoomSetSubjectUseCase(sl()));
  sl.registerLazySingleton(() => RegistrationsGetRegistrationsUseCase(sl()));
  sl.registerLazySingleton(() => RegistrationsSetRegistrationUseCase(sl()));
  sl.registerLazySingleton(() => RegistrationsDeleteRegistrationUseCase(sl()));
  sl.registerLazySingleton<StudentsRepository>(
      () => StudentsRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<SubjectsRepository>(
      () => SubjectsRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<ClassRoomRepository>(() => ClassRoomRepositoryImpl(
      remoteDataSource: sl(), subjectsRemoteDataSource: sl()));
  sl.registerLazySingleton<RegistrationsRepository>(() =>
      RegistrationsRepositoryImpl(
          remoteDataSource: sl(),
          subjectsRemoteDataSource: sl(),
          studentsRemoteDataSource: sl()));
  sl.registerLazySingleton<StudentsRemoteDataSource>(
      () => StudentsRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<SubjectsRemoteDataSource>(
      () => SubjectsRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<ClassRoomRemoteDataSource>(
      () => ClassRoomRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<RegistrationsRemoteDataSource>(
      () => RegistrationsRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton(() => http.Client());
}
