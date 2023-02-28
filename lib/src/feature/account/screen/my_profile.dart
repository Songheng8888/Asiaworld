import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/account/bloc/index.dart';
import 'package:royal_landapp/src/feature/account/model/acc_model.dart';
import 'package:royal_landapp/src/feature/account/screen/edit_profile_page.dart';

import 'package:royal_landapp/src/feature/auth/bloc/index.dart';
import 'package:royal_landapp/src/feature/language/sreen/language.dart';
import 'package:royal_landapp/src/feature/subscription/bloc/index.dart';
import 'package:royal_landapp/src/feature/subscription/screen/subscription_page.dart';

import '../../../appLocalizations.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Body();
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AccountBloc>(context).add(FetchAccountStarted());
    return Scaffold(
      appBar: AppBar(
        //     brightness: Brightness.light,
        // elevation: 0,
        backgroundColor: Colors.indigo,
        title: Text("Account Setting"),
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (con) => EditProfilePage(
                              accountModel:
                                  BlocProvider.of<AccountBloc>(context)
                                      .accountModel!,
                            )));
              })
        ],
      ),
      body: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          if (state is FethchingAccount) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ErrorFethchingAccount) {
            return Center(
              child: Text(state.error.toString()),
            );
          }

          return Container(
            color: Colors.grey.withOpacity(0.2),
            child: ListView(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    // decoration: BoxDecoration(
                    //   gradient: LinearGradient(
                    //       // colors: [HexColor("#83eaf1"), HexColor("#63a4ff")],
                    //       colors: [Colors.indigo, Colors.deepPurple],
                    //       // colors: [Colors.blue, Colors.lightBlue],
                    //       // colors: [orangeColors, orangeLightColors],
                    //       end: Alignment.bottomCenter,
                    //       begin: Alignment.topCenter),
                    //   // borderRadius:
                    //   // BorderRadius.only(bottomLeft: Radius.circular(100))
                    // ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          // margin: EdgeInsets.only(top: 20),
                          // padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          child: BlocProvider.of<AccountBloc>(context)
                                      .accountModel!
                                      .image ==
                                  null
                              ? Container(
                                  height: 150,
                                  width: 150,

                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://image.flaticon.com/icons/png/512/295/295128.png",
                                  ),
                                  // child: Image.network(
                                  //     "https://image.flaticon.com/icons/png/512/295/295128.png"),
                                )
                              : Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "${BlocProvider.of<AccountBloc>(context).accountModel!.image}",
                                    ),
                                  )),
                        ),
                        // BlocProvider.of<AccountBloc>(context)
                        //             .accountModel!
                        //             .image ==
                        //         null
                        //     ? CircleAvatar(
                        //         backgroundColor: Colors.white,
                        //         backgroundImage: AssetImage(
                        //           "assets/icon/avartar.png",
                        //         ),
                        //         radius: 10.0,
                        //       )
                        //     : CircleAvatar(
                        //         backgroundColor: Colors.white,
                        //         backgroundImage: NetworkImage(
                        //           "${BlocProvider.of<AccountBloc>(context).accountModel!.image}",
                        //         ),
                        //         radius: 10.0,
                        //       )),

                        SizedBox(
                          width: 1,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            "${BlocProvider.of<AccountBloc>(context).accountModel!.name}"
                                .toUpperCase(),
                            style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold),
                            textScaleFactor: 1.4,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              // Text(
                              //   "${BlocProvider.of<AccountBloc>(context).accountModel!.name}",
                              //   style: TextStyle(
                              //       color: Colors.white,
                              //       fontWeight: FontWeight.bold),
                              //   textScaleFactor: 1.4,
                              // ),
                              // Text(
                              //     BlocProvider.of<AccountBloc>(context)
                              //         .accountModel!
                              //         .userType!,
                              //     style: TextStyle(color: Colors.white)),
                              // Container(
                              //   margin: EdgeInsets.only(top: 5),
                              //   decoration: BoxDecoration(
                              //       color: Colors.blue,
                              //       borderRadius: BorderRadius.circular(20)),
                              //   height: 40,
                              //   child: FlatButton(
                              //       shape: RoundedRectangleBorder(
                              //           borderRadius:
                              //               BorderRadius.circular(20)),
                              //       onPressed: () {
                              //         Navigator.push(
                              //             context,
                              //             MaterialPageRoute(
                              //                 builder: (con) => EditProfilePage(
                              //                       accountModel: BlocProvider
                              //                               .of<AccountBloc>(
                              //                                   context)
                              //                           .accountModel!,
                              //                     )));
                              //       },
                              //       child: Text("Edit Profile",
                              //           style: TextStyle(color: Colors.white))),
                              // ),
                            ],
                          ),
                        )
                      ],
                    )),
                Container(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Personal Information",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.3,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Card(
                        child: Container(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Container(
                                  child: ListTile(
                                leading: Icon(
                                  Icons.people_alt_outlined,
                                ),
                                title: Text(
                                    "${BlocProvider.of<AccountBloc>(context).accountModel!.name}"),
                                trailing: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30.0,
                                ),
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (con) =>
                                  //             ChangeChangePasswordPage()));
                                },
                              )),
                              Divider(
                                height: 2.0,
                                color: Colors.grey[400],
                              ),
                              Container(
                                  child: ListTile(
                                leading: Icon(
                                  Icons.security_outlined,
                                ),
                                title: Text("Type:"),
                                trailing: Text(
                                    "${BlocProvider.of<AccountBloc>(context).accountModel!.userType}"),
                                onTap: () {},
                              )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildTitle(title: "Top skill & other skills"),
                _buildDescription(
                    title: BlocProvider.of<AccountBloc>(context)
                                .accountModel!
                                .skills ==
                            null
                        ? "No Data"
                        : "${BlocProvider.of<AccountBloc>(context).accountModel!.skills}"),
                _buildTitle(title: "Education"),
                _buildDescription(
                    title: BlocProvider.of<AccountBloc>(context)
                                .accountModel!
                                .educations ==
                            null
                        ? "No Data"
                        : "${BlocProvider.of<AccountBloc>(context).accountModel!.educations}"),
                _buildTitle(title: "Experiences"),
                _buildDescription(
                    title: BlocProvider.of<AccountBloc>(context)
                                .accountModel!
                                .experiences ==
                            null
                        ? "No Data"
                        : "${BlocProvider.of<AccountBloc>(context).accountModel!.experiences}"),
                Container(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Posting",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.3,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Card(
                        child: Container(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Container(
                                  child: ListTile(
                                leading: Icon(
                                  Icons.security_outlined,
                                ),
                                title: Text(
                                    "you can post ${BlocProvider.of<AccountBloc>(context).accountModel!.avalablePost}"),
                                trailing: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30.0,
                                ),
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (con) =>
                                  //             ChangeChangePasswordPage()));
                                },
                              )),
                              Divider(
                                height: 2.0,
                                color: Colors.grey[400],
                              ),
                              BlocProvider.of<AccountBloc>(context)
                                          .accountModel!
                                          .upgrade ==
                                      null
                                  ? Container()
                                  : Container(
                                      child: ListTile(
                                      leading: Icon(
                                        Icons.security_outlined,
                                      ),
                                      title: Text("Status:"),
                                      trailing: Text(
                                          "${BlocProvider.of<AccountBloc>(context).accountModel!.upgrade!.status}"),
                                      onTap: () {},
                                    )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "General",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.3,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Card(
                        child: Container(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Container(
                                  child: ListTile(
                                leading: Icon(
                                  Icons.security_outlined,
                                ),
                                title: Text("Change password"),
                                trailing: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30.0,
                                ),
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (con) =>
                                  //             ChangeChangePasswordPage()));
                                },
                              )),
                              Divider(
                                height: 2.0,
                                color: Colors.grey[400],
                              ),
                              Container(
                                  child: ListTile(
                                leading: Icon(
                                  Icons.security_outlined,
                                ),
                                title: Text("Posting"),
                                trailing: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30.0,
                                ),
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (con) =>
                                  //             ChangeChangePasswordPage()));
                                },
                              )),
                              Divider(
                                height: 2.0,
                                color: Colors.grey[400],
                              ),
                              Container(
                                  child: ListTile(
                                leading: Icon(Icons.favorite_outline),
                                title: Text("History"),
                                trailing: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30.0,
                                ),
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (con) => HistoryPage()));
                                },
                              )),
                              Divider(
                                height: 1.0,
                                color: Colors.grey[400],
                              ),
                              Container(
                                  child: ListTile(
                                leading: Icon(Icons.language_outlined),
                                title: Text(
                                  "Language",
                                ),
                                trailing: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30.0,
                                ),
                                onTap: () {
                                  languageModal(context);
                                },
                              )),
                              Divider(
                                height: 1.0,
                                color: Colors.grey[400],
                              ),
                              Container(
                                  child: ListTile(
                                leading: Icon(Icons.phone_iphone_outlined),
                                title: Text(
                                  "contact Us",
                                ),
                                trailing: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30.0,
                                ),
                                onTap: () {
                                  // contactUsModal(context);
                                },
                              )),
                              Divider(
                                height: 1.0,
                                color: Colors.grey[400],
                              ),
                              Container(
                                  child: ListTile(
                                leading: Icon(Icons.exit_to_app_outlined),
                                title: Text(
                                  "Exit",
                                ),
                                trailing: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30.0,
                                ),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                              AppLocalizations.of(context)!
                                                  .translate("alert")!),
                                          content: Text(
                                              AppLocalizations.of(context)!
                                                  .translate("wantToLeave")!),
                                          actions: <Widget>[
                                            FlatButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                  AppLocalizations.of(context)!
                                                      .translate("no")!),
                                            ),
                                            FlatButton(
                                              onPressed: () {
                                                BlocProvider.of<
                                                            AuthenticationBloc>(
                                                        context)
                                                    .add(LogoutPressed());
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                  AppLocalizations.of(context)!
                                                      .translate("yes")!),
                                            ),
                                          ],
                                        );
                                      });
                                },
                              )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
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
                        // BlocProvider.of<SubscriptionBloc>(context)
                        //     .add(FetchedSubscriptionStarted());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (con) => SubScriptionPage(
                                    accountModel:
                                        BlocProvider.of<AccountBloc>(context)
                                            .accountModel!)));
                      },
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Upgrade",
                        // AppLocalizations.of(context)!.translate("submit")!,
                        textScaleFactor: 1.2,
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _buildTitle({required String title}) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
        textScaleFactor: 1.3,
      ),
    );
  }

  _buildDescription({required String title}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0, left: 8.0, right: 8.0, top: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]!),
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(title),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Container(
            //       child: Row(
            //         children: [
            //           CupertinoButton(
            //               padding: EdgeInsets.all(10.0),
            //               color: Colors.indigo,
            //               child: Row(
            //                 children: [
            //                   Icon(Icons.edit_outlined),
            //                 ],
            //               ),
            //               onPressed: () {
            //                 // Navigator.push(
            //                 //     context,
            //                 //     MaterialPageRoute(
            //                 //         builder: (con) => EducationPage()));
            //               }),
            //           SizedBox(
            //             width: 4.0,
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
