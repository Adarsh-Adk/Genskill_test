import 'package:flutter/material.dart';
import 'package:genskill_test/features/initial/presentation/pages/HomePage.dart';

void main() {
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
