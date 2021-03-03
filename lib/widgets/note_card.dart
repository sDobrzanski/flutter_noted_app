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
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        color: Colors.lightBlueAccent[100],
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: kNoteBorderRad,
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              noteName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(noteDesc != null ? '${noteDesc!.substring(0, 1)}...' : ''),
            Text(
              noteLink != null ? '${noteLink!.substring(0, 1)}...' : '',
              style: TextStyle(color: Colors.blue[800]),
            ),
          ],
        ),
      ),
    );
  }
}
