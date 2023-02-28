import 'package:flutter/material.dart';

AppBar addEditAppBar(BuildContext context, String text) {
  return AppBar(
    brightness: Brightness.light,
    elevation: 0,
    backgroundColor: Colors.red,
    // backgroundColor: Colors.transparent,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_outlined,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    // centerTitle: true,
    title: Text(
      text,
      style: TextStyle(color: Colors.white, fontFamily: 'BattambangRegular'),
      textScaleFactor: 1.1,
    ),
  );
}
