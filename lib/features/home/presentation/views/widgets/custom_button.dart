import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.leftDimetions = 16,
      this.rightDimetions = 16,
      required this.backgroundColor,
      required this.textColor,
      required this.text,
      this.onPressed});
  final double leftDimetions;
  final double rightDimetions;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(leftDimetions),
              topRight: Radius.circular(rightDimetions),
              bottomLeft: Radius.circular(leftDimetions),
              bottomRight: Radius.circular(rightDimetions),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
