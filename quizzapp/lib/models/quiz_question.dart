import 'package:html_unescape/html_unescape.dart';

class QuizQuestion {
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

    QuizQuestion({
  required this.question,
  required this.correctAnswer,
  required this.incorrectAnswers,
  });

factory QuizQuestion.fromJson(Map<String, dynamic> json) {
  final unescape = HtmlUnescape();
  return QuizQuestion(
    question: unescape.convert(json['question'] as String),
    correctAnswer: unescape.convert(json['correct_answer'] as String),
    incorrectAnswers: (json['incorrect_answers'] as List)
    .map((e) => unescape.convert(e as String))
    .toList(),
  );
}

  List<String> get allAnswers {
  final answers = List<String>.from(incorrectAnswers);
  answers.add(correctAnswer);
  return answers;
  }
}