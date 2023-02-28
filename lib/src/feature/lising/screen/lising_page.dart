import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:royal_landapp/src/feature/myproperty/bloc/index.dart';

import 'package:lottie/lottie.dart';

MyPropertyBloc myPropertyBloc = MyPropertyBloc();

class LisingPage extends StatefulWidget {
  const LisingPage({Key? key}) : super(key: key);

  @override
  State<LisingPage> createState() => _LisingPageState();
}

class _LisingPageState extends State<LisingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        child: FloatingActionButton(
            backgroundColor: Colors.red,
            child: Icon(Icons.add),
            elevation: 0,
            onPressed: () {}),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          "Leasing ",
          style: TextStyle(
            color: Colors.white,
          ),
          textScaleFactor: 1.1,
        ),
      ),
      backgroundColor: Colors.red,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final RefreshController _refreshController = RefreshController();
  @override
  void initState() {
    myPropertyBloc.add(FetchMyPropertyStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: myPropertyBloc,
        builder: (context, state) {
          if (state is FetchingMyProperty) {
            return Center(
              child: Lottie.asset('assets/animation/97443-loading-gray.json',
                  width: 70, height: 70),
            );
          }
          if (state is ErrorFetchingMyProperty) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            controller: _refreshController,
            onLoading: () {},
            onRefresh: () {},
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      top: 5,
                      left: 10,
                      right: 10,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        child: Row(children: [
                          Container(
                            height: 150,
                            width: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              child: Image.asset("assets/images/house1.jpeg",
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Motor bike"),
                                  Text("Price \$100")
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Motor bike"),
                                  Text("Price \$100")
                                ],
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                  );
                }),
          );
        },
        listener: (context, state) {});
  }
}
