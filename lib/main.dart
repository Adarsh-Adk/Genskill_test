import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genskill_test/features/initial/presentation/bloc/StudentsPageBloc/StudentsPageBloc.dart';
import 'package:genskill_test/features/initial/presentation/pages/HomePage.dart';
import 'package:genskill_test/InjectionContainer.dart' as di;
import 'features/initial/presentation/bloc/class_room_page/class_room_page_bloc.dart';
import 'features/initial/presentation/bloc/registration_page/registration_page_bloc.dart';
import 'features/initial/presentation/bloc/subjects_page/subjects_page_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GENSKILL TEST',
      home: MyHomePage(),
    );
  }
}
// bEf1A-apikey
