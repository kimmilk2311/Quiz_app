import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';

class QuizOption extends StatelessWidget {
  final int index;
  final int? selectedAnswer;
  final String answer;
  final VoidCallback onTap;

  const QuizOption({
    super.key,
    required this.index,
    required this.selectedAnswer,
    required this.answer,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size screen = MediaQuery.of(context).size;

    final bool isSelected = selectedAnswer == index;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? theme.primaryColor : Colors.white,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(180.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: screen.width * 0.75,
              child: Text(
                HtmlUnescape().convert(answer),
                maxLines: 5,
                style: TextStyle(
                  color: isSelected ? theme.primaryColor : Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            Icon(
              isSelected ? Icons.check_circle_outline : Icons.panorama_fish_eye,
              color: isSelected ? theme.primaryColor : Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
