import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CustomAnimatedLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TypewriterAnimatedTextKit(
      text: ['Noted'],
      speed: Duration(milliseconds: 100),
      textStyle: TextStyle(
        fontSize: 50.0,
        fontWeight: FontWeight.w900,
        color: Colors.lightBlue,
      ),
    );
  }
}
