import 'package:flutter/material.dart';
import 'package:meet/Needed/color.dart';

class JoinButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const JoinButton({
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
            primary: footerButtonColor,
            minimumSize: const Size(150, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            )),
      ),
    );
  }
}
