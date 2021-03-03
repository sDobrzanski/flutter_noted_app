import 'package:flutter/material.dart';
import 'package:utopia_recruitment_task/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final Function onChanged;
  final bool isPassword;
  final String hintText;
  final IconData? icon;
  CustomTextField(
      {required this.onChanged,
      required this.isPassword,
      required this.hintText,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => onChanged(value),
      textAlign: TextAlign.left,
      keyboardType:
          isPassword ? TextInputType.text : TextInputType.emailAddress,
      obscureText: isPassword ? true : false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: kHintStyle,
        icon: Icon(
          icon,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
