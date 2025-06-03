import 'package:flutter/material.dart';
import 'package:quizzapp/pages/result.dart';
import 'package:quizzapp/pages/start.dart';
import 'package:quizzapp/pages/quiz.dart';


void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          surface: Color.fromRGBO(37, 44, 74, 1.0),
          primary: Color.fromRGBO(190, 56, 55, 1.0),
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(37, 44, 74, 1.0),
      ),
      routes: {
        '/start': (context) => const StartScreen(),
        '/quiz': (context) => const QuizScreen(), 
        '/result' : (context) => const ResultScreen(),
      },
      initialRoute: '/start', 
      debugShowCheckedModeBanner: false,
    );
  }
}