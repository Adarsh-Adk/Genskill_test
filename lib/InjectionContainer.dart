import 'package:genskill_test/features/initial/data/datasources/Students/StudentsDataRemoteSource.dart';
import 'package:genskill_test/features/initial/data/datasources/Students/StudentsDataRemoteSourceImpl.dart';
import 'package:genskill_test/features/initial/data/repositories/StudentsRepositoryImpl.dart';
import 'package:genskill_test/features/initial/domain/repositories/StudentsRepository.dart';
import 'package:genskill_test/features/initial/domain/repositories/SubjectsRepository.dart';
import 'package:genskill_test/features/initial/domain/usecases/GetStudents.dart';
import 'package:genskill_test/features/initial/domain/usecases/GetSubjects.dart';
import 'package:genskill_test/features/initial/presentation/bloc/StudentsPageBloc/StudentsPageBloc.dart';
import 'package:genskill_test/features/initial/presentation/bloc/subjects_page/subjects_page_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'features/initial/data/datasources/Subjects/SubjectsDataRemoteSource.dart';
import 'features/initial/data/datasources/Subjects/SubjectsDataRemoteSourceImpl.dart';
import 'features/initial/data/repositories/SubjectsRepositoryImpl.dart';

final sl = GetIt.instance;
Future<void> init()async{

  sl.registerLazySingleton<StudentsPageBloc>(() => StudentsPageBloc(student: sl()));
  sl.registerLazySingleton<SubjectsPageBloc>(() => SubjectsPageBloc(subject: sl()));
  sl.registerLazySingleton(() => GetStudents(sl()));
  sl.registerLazySingleton(() => GetSubjects(sl()));
  sl.registerLazySingleton<StudentsRepository>(() => StudentsRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<SubjectsRepository>(() => SubjectsRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<StudentsDataRemoteDataSource>(() => StudentsDataRemoteSourceImpl(client: sl()));
  sl.registerLazySingleton<SubjectsDataRemoteDataSource>(() => SubjectsDataRemoteSourceImpl(client: sl()));
  sl.registerLazySingleton(() => http.Client());



}