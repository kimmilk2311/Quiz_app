import 'package:flutter/material.dart';
import 'package:quizzapp/common/custombutton.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final int corrects = args['corrects'] as int;
    final int listLength = args['list_length'] as int;
    final DateTime startAt = args['start_at'] as DateTime;
    final int time = DateTime.now().difference(startAt).inSeconds;

    final bool isSuccess = corrects >= 5;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: screen.width - 40.0,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(6.0, 12.0),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: screen.width / 3.5,
                      width: screen.width / 3.5,
                      child: Image.asset(
                        isSuccess
                            ? 'assets/images/celebrate.png'
                            : 'assets/images/repeat.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      isSuccess ? 'Congratulations!!' : 'Completed!',
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      isSuccess ? 'You are amazing!!' : 'Better luck next time!',
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '$corrects/$listLength correct answers in $time seconds.',
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    CustomButton(
                      text: 'Play Again',
                      onPressed: () {
                        if (context.mounted) {
                          Navigator.pushReplacementNamed(context, '/start');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
