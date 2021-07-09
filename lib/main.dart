import 'package:flutter/material.dart';
import 'features/initial/presentation/pages/HomePage.dart';
import 'InjectionContainer.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GENSKILL TEST',
      home: MyHomePage(),
    );
  }
}
