import 'package:flutter/material.dart';
import 'package:meet/Needed/color.dart';

class Options extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onChange;
  const Options(
      {super.key,
      required this.text,
      required this.isMute,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Switch.adaptive(
              value: isMute,
              onChanged: onChange,
              activeColor: buttonColor,
            ),
          ),
        ],
      ),
    );
  }
}
