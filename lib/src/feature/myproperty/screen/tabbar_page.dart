import 'package:flutter/material.dart';

class TabbarPage extends StatefulWidget {
  final TabController tabController;
  TabbarPage({required this.tabController});

  @override
  _TabbarPageState createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
     color: Colors.amberAccent[700],
      // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      // padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
      // height: 80,
      // color: Colors.blueGrey,
      child: TabBar(
        indicatorColor: Colors.red,
         unselectedLabelColor: Colors.amberAccent[700],
        
        controller: widget.tabController,
        indicator: ShapeDecoration(
            color: Colors.amberAccent[700],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
            ),
            
        tabs: [
          Tab(
            icon: Text(
              'All',
              textScaleFactor: 1,
              style: TextStyle(
                  color: Colors.white
                  // fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Tab(
            icon: Text(
              'Wanted',
              textScaleFactor: 1,
              style: TextStyle(
                 color: Colors.white
                  // fontSize: 20,
                  // fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Tab(
            icon: Text(
              'Rent',
              textScaleFactor: 1,
              style: TextStyle(
                 color: Colors.white
                  // fontSize: 20,
                  // fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Tab(
            icon: Text(
              'Sell',
              textScaleFactor: 1,
              style: TextStyle(
                 color: Colors.white
                  // fontSize: 20,
                  // fontWeight: FontWeight.w600,
                  ),
            ),
          ),
           Tab(
            icon: Text(
              'Buy',
              textScaleFactor: 1,
              style: TextStyle(
                 color: Colors.white
                  // fontSize: 20,
                  // fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
