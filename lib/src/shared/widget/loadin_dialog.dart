import 'package:flutter/material.dart';

Future<void> loadingDialogs(BuildContext context) async{
  return showDialog(
    context: context,
     builder: (BuildContext context){
       return WillPopScope(
         child: SimpleDialog(shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(20)),
           backgroundColor: Colors.white,
           children: [
             Center(
               child: Column(children: [
                 CircularProgressIndicator(),
                 SizedBox(height: 20,),
                 Text("Please Wait...", 
                 style:  TextStyle(color: Colors.black),)
               ],),
             ),
           ],),
        onWillPop: () async =>false );
     });
}