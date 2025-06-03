import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 30.0,
        ),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: onPressed != null
              ? (backgroundColor ?? theme.primaryColor)
              : Colors.grey,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          maxLines: 5,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
