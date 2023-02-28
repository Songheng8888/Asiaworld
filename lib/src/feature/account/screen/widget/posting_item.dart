import 'package:flutter/material.dart';
import 'package:royal_landapp/src/utils/share/appbar.dart';

class Postingitem extends StatelessWidget {
  const Postingitem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: standardAppBar(context, ""),
      body: Column(
        children: [
          Text("For Agent account")
        ],
      ),
    );
  }
}