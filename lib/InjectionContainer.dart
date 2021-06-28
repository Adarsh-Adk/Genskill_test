import 'package:genskill_test/features/initial/data/datasources/ClassRoom/ClassRoomRemoteDataSource.dart';
import 'package:genskill_test/features/initial/data/datasources/ClassRoom/ClassRoomRemoteDataSourceImpl.dart';
import 'package:genskill_test/features/initial/data/datasources/Students/StudentsRemoteDataSource.dart';
import 'package:genskill_test/features/initial/data/datasources/Students/StudentsRemoteDataSourceImpl.dart';
import 'package:genskill_test/features/initial/data/repositories/ClassRoomRepositoryImpl.dart';
import 'package:genskill_test/features/initial/data/repositories/StudentsRepositoryImpl.dart';
import 'package:genskill_test/features/initial/domain/repositories/ClassRoomRepository.dart';
import 'package:genskill_test/features/initial/domain/repositories/StudentsRepository.dart';
import 'package:genskill_test/features/initial/domain/repositories/SubjectsRepository.dart';
import 'package:genskill_test/features/initial/domain/usecases/ClassRoomGetClassRooms.dart';
import 'package:genskill_test/features/initial/domain/usecases/StudentsUseCase.dart';
import 'package:genskill_test/features/initial/domain/usecases/SubjectsUseCase.dart';
import 'package:genskill_test/features/initial/presentation/bloc/StudentsPageBloc/StudentsPageBloc.dart';
import 'package:genskill_test/features/initial/presentation/bloc/class_room_page/class_room_page_bloc.dart';
import 'package:genskill_test/features/initial/presentation/bloc/inner_class_room_page/inner_class_room_page_bloc.dart';
import 'package:genskill_test/features/initial/presentation/bloc/subjects_page/subjects_page_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'features/initial/data/datasources/Subjects/SubjectsRemoteDataSource.dart';
import 'features/initial/data/datasources/Subjects/SubjectsRemoteDataSourceImpl.dart';
import 'features/initial/data/repositories/SubjectsRepositoryImpl.dart';
import 'features/initial/domain/usecases/ClassRoomGetClassRoom.dart';

final sl = GetIt.instance;
Future<void> init()async{

  sl.registerLazySingleton<StudentsPageBloc>(() => StudentsPageBloc(student: sl()));
  sl.registerLazySingleton<SubjectsPageBloc>(() => SubjectsPageBloc(subject: sl()));
  sl.registerLazySingleton<ClassRoomPageBloc>(() => ClassRoomPageBloc(classrooms: sl()));
  sl.registerLazySingleton<InnerClassRoomPageBloc>(() => InnerClassRoomPageBloc(classRoom: sl()));
  sl.registerLazySingleton(() => StudentsUseCase(sl()));
  sl.registerLazySingleton(() => SubjectsUseCase(sl()));
  sl.registerLazySingleton(() => ClassRoomGetClassRooms(sl()));
  sl.registerLazySingleton(() => ClassRoomGetClassRoom(sl()));
  sl.registerLazySingleton<StudentsRepository>(() => StudentsRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<SubjectsRepository>(() => SubjectsRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<ClassRoomRepository>(() => ClassRoomRepositoryImpl(remoteDataSource: sl(), subjectsRemoteDataSource: sl()));
  sl.registerLazySingleton<StudentsRemoteDataSource>(() => StudentsRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<SubjectsRemoteDataSource>(() => SubjectsRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<ClassRoomRemoteDataSource>(() => ClassRoomRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton(() => http.Client());



}