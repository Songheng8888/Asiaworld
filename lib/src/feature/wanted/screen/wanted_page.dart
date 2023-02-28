import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/account/bloc/account_bloc.dart';
import 'package:royal_landapp/src/feature/wanted/bloc/index.dart';
import 'package:royal_landapp/src/feature/wanted/screen/add_wanted.dart';
import 'package:royal_landapp/src/feature/wanted/screen/edit_wanted.dart';
import 'package:royal_landapp/src/shared/widget/error_snackbar.dart';
import 'package:royal_landapp/src/shared/widget/loadin_dialog.dart';
import 'package:royal_landapp/src/utils/share/appbar.dart';

class WantedPage extends StatefulWidget {
  final String uerId;
  const WantedPage({required this.uerId}) ;

  @override
  _WantedPageState createState() => _WantedPageState();
}

class _WantedPageState extends State<WantedPage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WantedBloc>(context).add(FetchWantedStarted());
    return Scaffold(
      appBar: standardAppBar(context, "Wanted"),
      body: WantedBody(uerId: widget.uerId,),
      floatingActionButton: Container(
        child: FloatingActionButton(
            backgroundColor: Colors.amberAccent[700],
            child: Icon(Icons.add),
            elevation: 0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddWanted()));
            }),
      ),
    );
  }
}

class WantedBody extends StatefulWidget {
  final String uerId;
  WantedBody({required this.uerId});
  @override
  _WantedBodyState createState() => _WantedBodyState();
}

class _WantedBodyState extends State<WantedBody> {
  @override
  Widget build(BuildContext context) {
    //  BlocProvider.of<WantedBloc>(context).add(FetchWantedStarted());
   print(widget.uerId);
    return BlocBuilder<WantedBloc, WantedState>(
      builder: (context, state) {
        if (state is FetchingWanted) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorFetchingWanted) {
          return Center(
            child: Text(state.error),
          );
        } else {
            
          if (BlocProvider.of<WantedBloc>(context).wantedList.length == 0) {
            return Center(
              child: Text("No Data"),
            );
          }
          
        
          return BlocListener<WantedBloc, WantedState>(
            listener: (context, state) {
              if (state is AddingWanted) {
                loadingDialogs(context);
              } else if (state is ErrorAddingWanted) {
                Navigator.pop(context);
                errorSnackBar(text: state.error.toString(), context: context);
              } else if (state is AddedWanted) {
                Navigator.pop(context);
              }
            },
            child: ListView.builder(
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
                                  widget.uerId
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
                }),
          );
        }
      },
    );
  }
}
