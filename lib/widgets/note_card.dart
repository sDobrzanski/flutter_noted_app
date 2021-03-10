import 'package:flutter/material.dart';
import 'package:utopia_recruitment_task/constants/constants.dart';

class NoteCard extends StatelessWidget {
  final String noteName;
  final String? noteDesc;
  final String? noteLink;
  final Function onTap;
  NoteCard(
      {required this.noteName,
      this.noteDesc,
      this.noteLink,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: GestureDetector(
        onTap: () => onTap(),
        child: Card(
          color: Colors.lightBlueAccent[100],
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: kNoteBorderRad,
          ),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Center(
            child: Text(
              noteName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}
