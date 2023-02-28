import 'package:flutter/material.dart';

class TestStack extends StatefulWidget {
  const TestStack({Key? key}) : super(key: key);

  @override
  _TestStackState createState() => _TestStackState();
}

class _TestStackState extends State<TestStack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                      spreadRadius: 3.0,
                      offset: Offset(10.0, 10.0),
                    ),
                  ],
                ),
                alignment: Alignment.centerRight,
                width: 300,
                height: 300,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    'Container 1',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.red,
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey,
              //         blurRadius: 10.0,
              //         spreadRadius: 3.0,
              //         offset: Offset(10.0, 10.0),
              //       ),
              //     ],
              //   ),
              //   alignment: Alignment.centerRight,
              //   width: 300,
              //   height: 300,
              //   child: RotatedBox(
              //     quarterTurns: 1,
              //     child: Text(
              //       'Container 1',
              //       style: TextStyle(fontSize: 18.0, color: Colors.white),
              //     ),
              //   ),
              // ),
              // Positioned(
              //   left: -15,
              //   top: -15,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.green,
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.black54,
              //           blurRadius: 15.0,
              //           spreadRadius: 3.0,
              //           offset: Offset(10.0, 10.0),
              //         ),
              //       ],
              //     ),
              //     alignment: Alignment.bottomCenter,
              //     width: 250,
              //     height: 250,
              //     child: Text(
              //       'Container 2',
              //       style: TextStyle(fontSize: 18.0, color: Colors.white),
              //     ),
              //   ),
              // ),
              Positioned(
                bottom: -30,
                right: 30,
                left: 30,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  width: 500,
                  height: 200,
                  child: Text(
                    'Container 3',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
