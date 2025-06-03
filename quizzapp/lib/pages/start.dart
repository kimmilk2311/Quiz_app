import 'package:flutter/material.dart';
import 'package:quizzapp/common/custombutton.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 30.0),
              child: Image.asset(
                'assets/icons/quiz-logo.png',
                width: 150,
                height: 150,
              ),
            ),
            Center(
              child: CustomButton(
                text: 'Start Quiz!', 
                onPressed: () {
                   Navigator.pushNamed(context, '/quiz');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
