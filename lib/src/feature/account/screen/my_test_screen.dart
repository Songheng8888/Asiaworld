import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TestLeng extends StatefulWidget {
  @override
  State<TestLeng> createState() => _TestLengState();
}

class _TestLengState extends State<TestLeng> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Slidable(
          startActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: ((contex) {}),
                icon: Icons.phone,
                backgroundColor: Colors.blue,
              ),
              SlidableAction(
                onPressed: ((contex) {}),
                icon: Icons.chat,
                backgroundColor: Colors.red,
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              // SlidableAction(
              //   onPressed: ((contex) {}),
              //   icon: Icons.delete,
              //   backgroundColor: Colors.blue,
              // ),
              SlidableAction(
                onPressed: ((contex) {}),
                flex: 1,
                icon: Icons.delete,
                backgroundColor: Colors.red,
              ),
            ],
          ),
          child: Container(
            color: Colors.white,
            child: ListTile(
              title: Text('Songheng'),
              subtitle: Text('0962996961'),
              leading: Icon(
                Icons.person,
                size: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
