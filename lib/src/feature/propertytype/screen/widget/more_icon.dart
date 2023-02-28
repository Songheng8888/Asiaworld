import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../cagegory.dart';

Widget moreIcon(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (con) => AllCategory(
                    isAll: false,
                  )));
    },
    child: Container(
        height: 150,
        decoration: BoxDecoration(),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child:
                              Icon(Icons.arrow_forward, color: Colors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Text(
                        "More",
                        textScaleFactor: 1.4,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
  );
}
