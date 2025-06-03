import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quiz_question.dart';

class QuizApiService {
  static Future<List<QuizQuestion>> fetchQuestions() async {
    final response = await http.get(
      Uri.parse('https://opentdb.com/api.php?amount=10&category=18&type=multiple'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List)
          .map((json) => QuizQuestion.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load questions');
    }
  }
}
