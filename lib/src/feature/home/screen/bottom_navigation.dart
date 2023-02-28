import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/constants/app_constant.dart';
import 'package:royal_landapp/src/shared/bloc/indexing/indexing_event.dart';

import 'home.dart';

class AppBottomNavigationBar extends StatefulWidget {
  @override
  AppBottomNavigationBarState createState() => AppBottomNavigationBarState();
}

class AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bottomNavigationIndexBloc,
        builder: (con, dynamic state) {
          print(state);
          return CurvedNavigationBar(
            backgroundColor: Colors.white,
            color: Colors.red,
            animationDuration: Duration(microseconds: 1000),
            onTap: (int index) {
              setState(() {
                state = index;
                bottomNavigationIndexBloc!.add(Tapped(index: index));
              });
            },
            items: [
              ImageIcon(
                AssetImage('assets/icon/home1.png'),
                color: white,
              ),
              ImageIcon(
                AssetImage('assets/icon/category2.png'),
                color: white,
              ),
              ImageIcon(
                AssetImage('assets/icon/shopping1.png'),
                color: white,
              ),
              ImageIcon(
                AssetImage('assets/icon/leasing1.png'),
                color: white,
              ),
              ImageIcon(
                AssetImage('assets/icon/account1.png'),
                color: white,
              ),
            ],
          );
        });
  }
}
