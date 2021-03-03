import 'package:flutter/material.dart';

const kNoteBorderRad = BorderRadius.only(
  topLeft: Radius.circular(30),
  bottomLeft: Radius.circular(30),
  bottomRight: Radius.circular(30),
);

const kNoteNameStyle =
    TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold);

const kNoteTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 20,
);

const kHintStyle = TextStyle(
  fontSize: 15,
  color: Colors.grey,
);

const kDivider = Divider(
  height: 0,
  thickness: 2,
  color: Colors.grey,
);
