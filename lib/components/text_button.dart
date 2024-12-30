import 'package:calculator/constant.dart';
import 'package:flutter/material.dart';

class Textbutton extends StatelessWidget {
  const Textbutton({required this.text, required this.onPressed, super.key});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text,
      style: kTextStyle,
      ),
    );
  }
}
