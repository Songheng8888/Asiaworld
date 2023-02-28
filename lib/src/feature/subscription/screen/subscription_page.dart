import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/account/model/acc_model.dart';
import 'package:royal_landapp/src/feature/account/screen/upgrade_page.dart';
import 'package:royal_landapp/src/feature/subscription/bloc/index.dart';
import 'dart:io' show Platform;

import 'package:royal_landapp/src/utils/share/appbar.dart';

import '../../../appLocalizations.dart';

class SubScriptionPage extends StatelessWidget {
  final AccountModel accountModel;
  const SubScriptionPage({required this.accountModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          SubscriptionBloc()..add(FetchedSubscriptionStarted()),
      child: Body(
        accountModel: accountModel,
      ),
    );
  }
}

class Body extends StatefulWidget {
  final AccountModel accountModel;
  const Body({required this.accountModel});

  @override
  _SubScriptionPageState createState() => _SubScriptionPageState();
}

class _SubScriptionPageState extends State<Body> {
  int? _selectedIndex;
  String? id;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: standardAppBar(context, ""),
      body: BlocBuilder<SubscriptionBloc, SubscriptionState>(
          builder: (context, state) {
        if (state is FetchingSubscription) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ErrorFetchingSubscription) {
          return Container(
            child: Center(
              child: Text(state.error.toString()),
            ),
          );
        }
        return Container(
          margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
          child: Column(
            children: [
              Center(
                child: Container(
                  child: Text(
                      AppLocalizations.of(context)!.translate("chooseSub")!),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                  child: Form(
                key: _formKey,
                child: Container(
                  height: 200,
                  child: ListView.builder(
                      itemCount: BlocProvider.of<SubscriptionBloc>(context)
                          .sublist
                          .length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            _onSelected(index);
                            id = BlocProvider.of<SubscriptionBloc>(context)
                                .sublist[index]
                                .id;

                            print(index);
                            if (Platform.isAndroid) {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (con) => ReviewCart(
                              //               option: BlocProvider.of<
                              //                       SubscriptionBloc>(context)
                              //                   .sublist[index]
                              //                   .value,
                              //               price: BlocProvider.of<
                              //                       SubscriptionBloc>(context)
                              //                   .sublist[index]
                              //                   .price,
                              //             )));
                            } else {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (con) => ReviewCartIos(
                              //               option: BlocProvider.of<
                              //                       SubscriptionBloc>(context)
                              //                   .sublist[index]
                              //                   .value,
                              //               price: BlocProvider.of<
                              //                       SubscriptionBloc>(context)
                              //                   .sublist[index]
                              //                   .price,
                              //             )));
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //     color: _selectedIndex != null &&
                              //             _selectedIndex == index
                              //         ? Colors.blue
                              //         : Colors.grey),
                              borderRadius: BorderRadius.circular(6.0),
                              color: _selectedIndex != null &&
                                      _selectedIndex == index
                                  ? Colors.lightBlue[100]
                                  : Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 3,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: ListTile(
                              title: Text(
                                  "${BlocProvider.of<SubscriptionBloc>(context).sublist[index].des}"),
                              subtitle: Text(
                                  "${BlocProvider.of<SubscriptionBloc>(context).sublist[index].name}"),
                              // trailing: Icon(
                              //   Icons.check_outlined,
                              //   color: _selectedIndex != null &&
                              //           _selectedIndex == index
                              //       ? Colors.blue
                              //       : Colors.grey,
                              // ),
                            ),
                          ),
                        );
                      }),
                ),
              )),
              // Container(
              //   height: 50,
              //   width: MediaQuery.of(context).size.width,
              //   child: FlatButton(
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(5),
              //         // side: BorderSide(color: Colors.red)
              //       ),
              //       color: Colors.blue,
              //       onPressed: () {

              //       },
              //       padding: EdgeInsets.symmetric(vertical: 10),
              //       child: Text(
              //         "Continue",
              //         // AppLocalizations.of(context).translate("login"),
              //         textScaleFactor: 1.2,
              //         style: TextStyle(
              //             color: Colors.white,
              //             fontFamily: 'BattambangRegular'),
              //       )),
              // )
            ],
          ),
        );
      }),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        height: 50,
        width: double.infinity,
        child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              // side: BorderSide(color: Colors.red)
            ),
            color: Colors.blue,
            onPressed: () {
              print("id $id");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (con) => UpgradePage(
                            subscriptionId: id!,
                            accountModel: widget.accountModel,
                          )));
            },
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Continue",
              // AppLocalizations.of(context)!.translate("submit")!,
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
