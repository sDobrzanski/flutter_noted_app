import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color? color;
  CustomMainButton(
      {required this.text, required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        width: 150,
      ),
    );
  }
}
