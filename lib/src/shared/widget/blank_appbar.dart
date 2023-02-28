import 'package:flutter/material.dart';

AppBar blankAppBar(context) {
  return AppBar(
    brightness: Brightness.light,
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios_outlined,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
  );
}