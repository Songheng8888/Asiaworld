import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/account/screen/account_page.dart';
import 'package:royal_landapp/src/feature/account/screen/profile_screen.dart';
import 'package:royal_landapp/src/feature/home/screen/bottom_navigation.dart';
import 'package:royal_landapp/src/feature/home/screen/home_page.dart';
import 'package:royal_landapp/src/feature/myproperty/my_property_page.dart';
import 'package:royal_landapp/src/feature/propertytype/screen/cagegory.dart';
import 'package:royal_landapp/src/feature/shop/screen/shop_page.dart';
import 'package:royal_landapp/src/shared/bloc/indexing/indexing_bloc.dart';
import 'package:royal_landapp/src/shared/bloc/invoking/invoking_bloc.dart';

import 'new_home_screen.dart';

IndexingBloc? bottomNavigationIndexBloc;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  static List<InvokingBloc> bottomNavigationPagesInvokingBloc = [
    InvokingBloc(),
    InvokingBloc(),
    InvokingBloc(),
    InvokingBloc(),
    InvokingBloc(),
  ];
  final List<Widget> bottomNavigationPages = [
    HomeScreenNew(),
    AllCategory(
      isAll: true,
    ),
    ShopPage(),
    MyPropertyPage(),
    // AccountPage()
    AccountProfile()
  ];
  @override
  void initState() {
    bottomNavigationIndexBloc = IndexingBloc();
    [1, 2, 3, 4].forEach((element) {
      bottomNavigationPagesInvokingBloc.add(InvokingBloc());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: bottomNavigationIndexBloc,
        builder: (BuildContext context, int state) {
          return IndexedStack(
            index: state,
            children: this.bottomNavigationPages,
          );
        },
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
