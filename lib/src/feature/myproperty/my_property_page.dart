import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:royal_landapp/src/feature/myproperty/bloc/index.dart';
import 'package:royal_landapp/src/feature/myproperty/screen/add_property.dart';
import 'package:royal_landapp/src/shared/widget/error_snackbar.dart';
import 'screen/edit_property_page.dart';

MyPropertyBloc myPropertyBloc = MyPropertyBloc();

class MyPropertyPage extends StatefulWidget {
  const MyPropertyPage({Key? key}) : super(key: key);

  @override
  _HomePropertyState createState() => _HomePropertyState();
}

class _HomePropertyState extends State<MyPropertyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        child: FloatingActionButton(
            backgroundColor: Colors.red,
            child: Icon(Icons.add),
            elevation: 0,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddPropertyPage()));
            }),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          "My Leasing",
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
            borderRadius:
                BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
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
    myPropertyBloc.add(InitilizeMyPropertyStarted(isRefresh: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: myPropertyBloc,
      builder: (context, state) {
        if (state is InitailizingMyProperty) {
          return Center(
            child: Lottie.asset('assets/animation/97443-loading-gray.json', width: 50, height: 50),
          );
        }
        if (state is ErrorFetchingMyProperty) {
          return Center(
            child: Text(state.error.toString()),
          );
        } else {
          if (myPropertyBloc.myprolist.length == 0) {
            return Center(
              child: Text("No data"),
            );
          }
          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            controller: _refreshController,
            onLoading: () {
              myPropertyBloc.add(FetchMyPropertyStarted());
            },
            onRefresh: () {
              myPropertyBloc.add(InitilizeMyPropertyStarted(isRefresh: true));
            },
            child: ListView.builder(
              itemCount: myPropertyBloc.myprolist.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    top: 5,
                    left: 10,
                    right: 10,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  // child: ExtendedImage.network(
                                  //   myPropertyBloc.myprolist[index].img!,
                                  //   // "assets/images/asiaworld-01.png",
                                  //   cacheWidth: 1000,
                                  //   // cacheHeight: 400,
                                  //   enableMemoryCache: true,
                                  //   clearMemoryCacheWhenDispose: true,
                                  //   clearMemoryCacheIfFailed: false,
                                  //   fit: BoxFit.fill,
                                  //   width: double.infinity,
                                  // ),
                                  child: FadeInImage.assetNetwork(
                                      fit: BoxFit.fill,
                                      placeholder: "assets/icon/app1.png",
                                      image: myPropertyBloc.myprolist[index].img!,
                                      imageErrorBuilder: (context, error, stackTrace) {
                                        return InkWell(
                                          onTap: () {},
                                          child: Image.asset("assets/icon/app1.png"),
                                        );
                                      }),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 5, bottom: 5),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Code : "),
                                          Text(
                                            // "",
                                            myPropertyBloc.myprolist[index].propertyCode!
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.grey, fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 5, bottom: 5),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Name : "),
                                          Expanded(
                                            child: Text(
                                                myPropertyBloc.myprolist[index].propertyName!,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.bold)),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 5, bottom: 5),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Price : "),
                                          Text(
                                              "\$${myPropertyBloc.myprolist[index].propertyPrice!}",
                                              style: TextStyle(
                                                  color: Colors.red, fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          CupertinoButton(
                                            padding: EdgeInsets.all(1.0),
                                            color: Colors.green,
                                            child: Row(
                                              children: [
                                                Icon(Icons.edit),
                                              ],
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => EditProperty(
                                                    propertyModel: myPropertyBloc.myprolist[index],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          CupertinoButton(
                                              padding: EdgeInsets.all(1.0),
                                              color: Colors.red,
                                              child: Row(
                                                children: [
                                                  Icon(Icons.delete),
                                                ],
                                              ),
                                              onPressed: () {
                                                myPropertyBloc.add(DeleteMyPropertyStarted(
                                                    id: myPropertyBloc.myprolist[index].id));
                                              }),
                                          SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
      listener: (context, state) {
        if (state is FetchedMyProperty) {
          _refreshController.loadComplete();
          _refreshController.refreshCompleted();
        }
        if (state is EndofMyPropertyList) {
          _refreshController.loadNoData();
        }
        if (state is AddingMyProperty) {
          EasyLoading.show(status: "loading....");
        }
        if (state is ErrorAddingMyProperty) {
          EasyLoading.dismiss();
          errorSnackBar(text: state.error.toString(), context: context);
        }
        if (state is AddedMyProperty) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess("Sucess");
        }
      },
    );
  }
}
