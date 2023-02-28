import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:royal_landapp/src/feature/account/bloc/index.dart';
import 'package:royal_landapp/src/feature/myproperty/bloc/index.dart';
import 'package:royal_landapp/src/feature/myproperty/screen/add_property.dart';
import 'package:royal_landapp/src/feature/myproperty/screen/item_property.dart';
import 'package:royal_landapp/src/feature/myproperty/screen/tabbar_page.dart';
import 'package:royal_landapp/src/feature/wanted/bloc/index.dart';
import 'package:royal_landapp/src/feature/wanted/screen/edit_wanted.dart';

class MyPropertyPageOne extends StatefulWidget {
  
   MyPropertyPageOne() ;

  @override
  State<MyPropertyPageOne> createState() => _MyPropertyPageOneState();
}

class _MyPropertyPageOneState extends State<MyPropertyPageOne> with TickerProviderStateMixin{
    final RefreshController _refreshController = RefreshController();
//   @override
//   Widget build(BuildContext context) {

  TabController? tabController;
  int currentTabIndex = 0;
  void onTabChange() {
    setState(() {
      currentTabIndex = tabController!.index;
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);

    tabController!.addListener(() {
      onTabChange();
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController!.addListener(() {
      onTabChange();
    });

    tabController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        BlocProvider.of<MyPropertyBloc>(context).add(FetchMyPropertyStarted());
        BlocProvider.of<WantedBloc>(context).add(FetchMyWantedStarted());
         BlocProvider.of<AccountBloc>(context).add(FetchAccountStarted());
    return Scaffold(
      backgroundColor: Colors.amberAccent[700],
      floatingActionButton: Container(
        child: FloatingActionButton(
            backgroundColor: Colors.amberAccent[700],
            child: Icon(Icons.add),
            elevation: 0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddPropertyPage()));
            }),
      ),
      //  FloatingActionButton(
      //     child: Text("data"),
      //     onPressed: () => Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => CategoryPage()))),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
       appBar: AppBar(
          brightness: Brightness.light,
    elevation: 0,
         automaticallyImplyLeading: false,
        backgroundColor: Colors.amberAccent[700],
        title:  Text(
          "My Property",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          TabbarPage(tabController: tabController!),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: TabBarView(
                controller: tabController,
                children: [
                  Container(
                    // color: Colors.green,
                    child: Column(
                      children: [
                        // SearchPage(),
                        Expanded(
                          child: Container(
                  
                     child: BlocBuilder<MyPropertyBloc, MyPropertyState>(
                        builder: (context, state) {
                          print(state);
                      if (state is FetchingMyProperty) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is ErrorFetchingMyProperty) {
                        return Text(state.error.toString());
                      }else{
                        if(BlocProvider.of<MyPropertyBloc>(context).myprolist.length==0){
                          return Center(
                            child: Text("No Data"),
                          );
                        }
                        return BlocListener<MyPropertyBloc, MyPropertyState>(listener: (context,state){
                          if(state is FetchedMyProperty){
                            _refreshController.loadComplete();
                          }

                        },child: SmartRefresher( controller: _refreshController,
                                      onRefresh: () {},
                                      onLoading: () {
                                        
                                        
                                      },
                                      enablePullDown: true,
                                      enablePullUp: true,
                                      child: Column(
                      children: [
                        GridView.builder(
                          cacheExtent: 0,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          // padding: EdgeInsets.only(left: 10, top: 10, right: 0),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 4 / 6,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 10),
                          itemCount: BlocProvider.of<MyPropertyBloc>(context)
                              .myprolist
                              .length,
                          itemBuilder: (context, index) {
                            return Item(
                              // showIcon: true,
                              propertyModel:
                                  BlocProvider.of<MyPropertyBloc>(context)
                                      .myprolist[index],
                            );
                          },
                        ),
                      ],
                    ),));
                      
                    }
                    
                    
                  }),
                  ),
                          ),
                        
                      ],
                    ),
                  ),
                  // available
                 Container(
                    // color: Colors.green,
                    child: Column(
                      children: [
                        // SearchPage(),
                        Expanded(
                          child: Container(
                  
                     child: BlocBuilder<WantedBloc, WantedState>(
                        builder: (context, state) {
                          print(state);
                      if (state is FetchingWanted) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is ErrorFetchingWanted) {
                        return Text(state.error.toString());
                      }else{
                        if(BlocProvider.of<WantedBloc>(context).wantedList.length==0){
                          return Center(
                            child: Text("No Data"),
                          );
                        }
                        return BlocListener<WantedBloc, WantedState>(listener: (context,state){
                          // if(state is FetchedMyProperty){
                          //   _refreshController.loadComplete();
                          // }

                        },child: ListView.builder(
                itemCount:
                    BlocProvider.of<WantedBloc>(context).wantedList.length,
                itemBuilder: (context, index) {
                
                  return Container(
                    margin:
                        EdgeInsets.only(bottom: 10.0, left: 8.0, right: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellow),
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 3,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            // mainAxisAlignment:
                            //     MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  "I Want :",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Text(
                                "${BlocProvider.of<WantedBloc>(context).wantedList[index].propertyTypeModel.name}",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  "Price :",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${BlocProvider.of<WantedBloc>(context).wantedList[index].mixPrice} ",
                                    style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                                  ),
                                  Text("- "),
                                  Text(
                                    " ${BlocProvider.of<WantedBloc>(context).wantedList[index].maxPrice}",
                                    style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  "Contact :",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Text(
                                "${BlocProvider.of<WantedBloc>(context).wantedList[index].contactNumber}",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,  
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Text(
                                  "Description :",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Text(
                                "${BlocProvider.of<WantedBloc>(context).wantedList[index].description}",
                              ),
                            ],
                          ),

                          BlocProvider.of<WantedBloc>(context)
                        .wantedList[index]
                        .userId ==
                                  BlocProvider.of<AccountBloc>(context).accountModel!.id
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
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
                                    builder: (con) => EditWanted(
                                          wantedModel: BlocProvider
                                                  .of<WantedBloc>(
                                                      context)
                                              .wantedList[index],
                                        )));
                          }),
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
                            print(
                                "id ${BlocProvider.of<WantedBloc>(context).wantedList[index].id}");
                            BlocProvider.of<WantedBloc>(context)
                                .add(DeletedWantedStarted(
                                    id: BlocProvider.of<
                                            WantedBloc>(context)
                                        .wantedList[index]
                                        .id));
                          }),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  );
                })
                    );
                      
                    }
                    
                    
                  }),
                  ),
                          ),
                        
                      ],
                    ),
                  ),

                  // reservation
                  Container(
                    // color: Colors.green,
                    child: Column(
                      children: [
                        // SearchPage(),
                        Expanded(
                          child:Container(child: Text("Hi"),)
                          ),
                        
                      ],
                    ),
                  ),
                  // checkin
                  Container(
                    // color: Colors.green,
                    child: Column(
                      children: [
                        // SearchPage(),
                        Expanded(
                          child:Container(child: Text("Hi"),)
                          ),
                        
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.green,
                    child: Column(
                      children: [
                        // SearchPage(),
                        Expanded(
                          child:Container(child: Text("Hi"),)
                          ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}