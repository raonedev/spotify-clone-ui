import 'package:flutter/material.dart';

class CustomFilledLargeButton extends StatelessWidget {
  const CustomFilledLargeButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.width,
      required this.height});
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width, height),
          backgroundColor: const Color(0xFF059FB4),
          elevation: 5,
          shadowColor: const Color(0xFF39C0D4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.82,
          ),
        ),
      ),
    );
  }
}
