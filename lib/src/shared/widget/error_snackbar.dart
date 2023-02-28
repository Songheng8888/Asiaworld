import 'package:flutter/material.dart';

void errorSnackBar({required String text , required BuildContext context}){
  // ignore: deprecated_member_use
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text (text , 
    style: TextStyle(color: Colors.white),),
    behavior: SnackBarBehavior.floating,
    ));
}