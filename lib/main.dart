import 'package:flutter/material.dart';
import 'package:quiz/pages/home_page.dart';
import 'package:quiz/pages/test_page.dart';
import 'package:quiz/pages/result_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: HomePage(),
    );
  }
}
