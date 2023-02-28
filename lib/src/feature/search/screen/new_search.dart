import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:royal_landapp/src/feature/account/screen/account_page.dart';
import 'package:royal_landapp/src/feature/myproperty/bloc/myproperty_event.dart';
import 'package:royal_landapp/src/feature/myproperty/bloc/myproperty_state.dart';
import 'package:royal_landapp/src/feature/myproperty/my_property_page.dart';
import 'package:royal_landapp/src/feature/myproperty/screen/add_property.dart';
import 'package:royal_landapp/src/feature/myproperty/screen/edit_property_page.dart';
import 'package:royal_landapp/src/feature/property/bloc/index.dart';
import 'package:royal_landapp/src/shared/widget/error_snackbar.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = 'Search query';

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      autocorrect: true,
      decoration: InputDecoration(
        hintText: 'Search here...',
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
      onChanged: (query) => updateSearchQuery(query),
    );
  }

  List<Widget> _buildAction() {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          _clearSearchQuery();
        },
      ),
    ];
  }

  void _clearSearchQuery() {
    setState(() {
      _searchController.clear();
      updateSearchQuery('');
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
      print(searchQuery);
      BlocProvider.of<PropertyBloc>(context).add(FetchPropertyStarted());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: _buildSearchField(),
        actions: _buildAction(),
      ),
      backgroundColor: Colors.white,
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
              // child:
              //     Lottie.asset('assets/animation/97443-loading-gray.json', width: 50, height: 50),
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
                }),
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
