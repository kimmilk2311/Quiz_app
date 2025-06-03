import 'package:flutter/material.dart';
import 'package:quizzapp/common/custombutton.dart';
import 'package:quizzapp/common/quiz_option.dart';
import 'package:quizzapp/services/quiz_api.dart';
import '../models/quiz_question.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Future<List<QuizQuestion>> _futureQuestions;
  late DateTime _startAt;
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    _futureQuestions = QuizApiService.fetchQuestions();
    _startAt = DateTime.now();
  }

  void _nextQuestion(List<QuizQuestion> questions) {
    if (_selectedIndex != null) {
      if (questions[_currentIndex].allAnswers[_selectedIndex!] ==
          questions[_currentIndex].correctAnswer) {
        _score++;
      }
      setState(() {
        _selectedIndex = null;
        if (_currentIndex < questions.length - 1) {
          _currentIndex++;
        } else {
          Navigator.pushReplacementNamed (
            context,
            '/result',
            arguments: {
              'corrects': _score,
              'list_length': questions.length,
              'start_at': _startAt,
            },
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<QuizQuestion>>(
      future: _futureQuestions,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Lỗi: ${snapshot.error}'));
        }
        final questions = snapshot.data!;
        final question = questions[_currentIndex];
        final answers = question.allAnswers;

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            elevation: 0,
            actions: [
             IconButton(
            icon: const Icon(
            Icons.close, 
            color: Colors.white,
            size: 36,
            ),
            tooltip: 'Back',
            onPressed: () {
            Navigator.pop(context); // Quay về màn trước
          },
      ),
          const SizedBox(width: 8),
    ],
    ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Question ${_currentIndex + 1}/${questions.length}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  question.question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white, 
                  ),
                ),
                const SizedBox(height: 50),
                ...List.generate(
                  answers.length,
                  (index) => QuizOption(
                    index: index,
                    selectedAnswer: _selectedIndex,
                    answer: answers[index],
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: _currentIndex < questions.length - 1 ? 'Next' : 'End',
                  onPressed: _selectedIndex == null
                  ? null
                  : () => _nextQuestion(questions),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
