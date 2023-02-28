import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:royal_landapp/src/feature/notification/screen/notification_page.dart';

Widget appBar({required BuildContext context}) {
  double statusBarHeight = MediaQuery.of(context).padding.top;

  return Container(
  
    margin: EdgeInsets.all(0),
    width: MediaQuery.of(context).size.width - 30,
    height: double.infinity,
    color: Colors.red,

    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
      
        Expanded(
          child: GestureDetector(
            onTap: () {
              // showSearch(context: context, delegate: SearchPage());
            },
            child: Container(
              height: double.infinity,
              margin: EdgeInsets.only(
                  left: 10, top: statusBarHeight + 10, right: 15, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Asia World",
                    textScaleFactor: 1.6,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: double.infinity,
            margin: EdgeInsets.only(
                left: 10, top: statusBarHeight + 10, right: 15, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationPage()));
                  },
                  child: Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.search_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
       
      ],
    ),
  );
 
}
