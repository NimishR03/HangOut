import 'package:flutter/material.dart';
import 'package:meet/Needed/color.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const LoginButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(fontSize: 17)),
        style: ElevatedButton.styleFrom(
            primary: buttonColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: const BorderSide(color: buttonColor))),
      ),
    );
  }
}
