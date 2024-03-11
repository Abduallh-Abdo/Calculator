import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const CustomButtons({
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: getBgColor(text),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Color getBgColor(String text) {
    if (text == 'C' ||
        text == '%' ||
        text == '⌦' ||
        text == '÷' ||
        text == 'x' ||
        text == '-' ||
        text == '+') {
      return const Color(0xff333337);
    } else if (text == '=') {
      return const Color.fromARGB(255, 253, 132, 4);
    } else {
      return const Color.fromARGB(255, 24, 21, 21);
    }
  }
}
