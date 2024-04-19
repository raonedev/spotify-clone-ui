import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton(
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
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23),
        ),
        side: const BorderSide(
          color: Color(0XFF39C0D4),
          width: 2,
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF00C2CB),
          fontSize: 10,
          fontFamily: 'Century Gothic',
          fontWeight: FontWeight.w400,
          height: 0,
          letterSpacing: 1.20,
        ),
      ),
    );
  }
}
