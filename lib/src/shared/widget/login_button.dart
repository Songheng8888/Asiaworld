import 'package:flutter/material.dart';

Widget pressButton(
        {required BuildContext context,
        required String title,
        required Function onTap}) =>
    Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      height: 50,
      width: double.infinity,
      // ignore: deprecated_member_use
      child: FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: Colors.indigo,
          onPressed: () {
            onTap();
          },
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            title,
            textScaleFactor: 1.2,
            style: TextStyle(color: Colors.white, fontSize: 18),
          )),
    );
