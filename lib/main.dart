import 'package:flutter/material.dart';
import 'package:msq_exam/screens/exam.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Linux Exam',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home_screen',
      routes: {
        HomeScreen.id: (ctx) => HomeScreen(),
        Exam.id: (ctx) => Exam(),
      },
    );
  }
}
