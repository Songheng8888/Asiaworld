import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:royal_landapp/src/appLocalizations.dart';
import 'package:royal_landapp/src/constants/app_constant.dart';
import 'package:royal_landapp/src/feature/account/bloc/index.dart';
import 'package:royal_landapp/src/feature/auth/bloc/authentication_bloc.dart';
import 'package:royal_landapp/src/feature/auth/bloc/authentication_event.dart';
import 'package:royal_landapp/src/feature/language/sreen/language.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BlocProvider.of<AccountBloc>(context).add(FetchAccountStarted());

    return BlocBuilder<AccountBloc, AccountState>(
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
        // return SingleChildScrollView(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       Container(
        //         height: MediaQuery.of(context).size.height * 0.3,
        //         decoration: BoxDecoration(
        //           color: Colors.red,
        //         ),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             SizedBox(
        //               height: 30,
        //             ),
        //             Center(
        //               child: Container(
        //                 height: 120,
        //                 width: 120,
        //                 child: BlocProvider.of<AccountBloc>(context)
        //                             .accountModel!
        //                             .image ==
        //                         null
        //                     ? CircleAvatar(
        //                         backgroundColor: Colors.white,
        //                         backgroundImage: AssetImage(
        //                           "assets/icon/avartar.png",
        //                         ),
        //                         radius: 50.0,
        //                       )
        //                     : CircleAvatar(
        //                         backgroundColor: Colors.white,
        //                         backgroundImage: NetworkImage(
        //                           "${BlocProvider.of<AccountBloc>(context).accountModel!.image}",
        //                         ),
        //                         radius: 50.0,
        //                       ),
        //               ),
        //             ),
        //             Center(
        //                 child: Text(
        //               "${BlocProvider.of<AccountBloc>(context).accountModel!.name}",
        //               style: TextStyle(color: Colors.white, fontSize: 20),
        //             )),
        //             Center(
        //                 child: Text(
        //               "${BlocProvider.of<AccountBloc>(context).accountModel!.phone}",
        //               style: TextStyle(color: Colors.white, fontSize: 20),
        //             ))
        //           ],
        //         ),
        //       ),
        //       SizedBox(
        //         height: 20.0,
        //       ),
        //       Row(
        //         children: [
        //           Container(
        //             padding: EdgeInsets.only(left: 10, top: 10),
        //             child: Text(
        //               "General",
        //               style: TextStyle(fontWeight: FontWeight.bold),
        //               textScaleFactor: 1.5,
        //             ),
        //           ),
        //         ],
        //       ),
        //       Container(
        //         // margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        //         child: Column(
        //           mainAxisSize: MainAxisSize.max,
        //           children: <Widget>[
        //             Card(
        //               child: Container(
        //                 // padding: EdgeInsets.only(left: 10.0, right: 10.0),
        //                 decoration: BoxDecoration(
        //                   // borderRadius: BorderRadius.circular(8.0),
        //                   color: Colors.white,
        //                 ),
        //                 child: Column(
        //                   children: [
        //                     _builContainer(
        //                         iconData: Icons.account_balance_outlined,
        //                         title: "Personal Info",
        //                         iconColor: Colors.red,
        //                         onTap: () {}),
        //                     Container(
        //                       margin: EdgeInsets.only(left: 50),
        //                       child: Divider(
        //                         height: 2.0,
        //                         color: Colors.grey[400],
        //                       ),
        //                     ),
        //                     _builContainer(
        //                         iconData: Icons.person_outline,
        //                         title: "History",
        //                         iconColor: Colors.blue,
        //                         onTap: () {}),
        //                     Container(
        //                       margin: EdgeInsets.only(left: 50),
        //                       child: Divider(
        //                         height: 2.0,
        //                         color: Colors.grey[400],
        //                       ),
        //                     ),
        //                     _builContainer(
        //                         iconData: Icons.language_outlined,
        //                         title: "Language",
        //                         iconColor: Colors.amber,
        //                         onTap: () {
        //                           languageModal(context);
        //                         }),
        //                     Container(
        //                       margin: EdgeInsets.only(left: 50),
        //                       child: Divider(
        //                         height: 2.0,
        //                         color: Colors.grey[400],
        //                       ),
        //                     ),
        //                     _builContainer(
        //                         iconData: Icons.phone_iphone_outlined,
        //                         title: "Contact us",
        //                         iconColor: Colors.green,
        //                         onTap: () {
        //                           contactUsModal(context);
        //                         }),
        //                     Container(
        //                       margin: EdgeInsets.only(left: 50),
        //                       child: Divider(
        //                         height: 2.0,
        //                         color: Colors.grey[400],
        //                       ),
        //                     ),
        //                     _builContainer(
        //                         iconData: Icons.exit_to_app_outlined,
        //                         title: "Exit",
        //                         iconColor: Colors.red,
        //                         onTap: () {
        //                           showDialog(
        //                               context: context,
        //                               builder: (BuildContext context) {
        //                                 return AlertDialog(
        //                                   title: Text(
        //                                       AppLocalizations.of(context)!
        //                                           .translate("alert")!),
        //                                   content: Text(
        //                                       AppLocalizations.of(context)!
        //                                           .translate("wantToLeave")!),
        //                                   actions: <Widget>[
        //                                     FlatButton(
        //                                       onPressed: () {
        //                                         Navigator.pop(context);
        //                                       },
        //                                       child: Text(
        //                                           AppLocalizations.of(context)!
        //                                               .translate("no")!),
        //                                     ),
        //                                     FlatButton(
        //                                       onPressed: () {
        //                                         BlocProvider.of<
        //                                                     AuthenticationBloc>(
        //                                                 context)
        //                                             .add(LogoutPressed());
        //                                         Navigator.pop(context);
        //                                       },
        //                                       child: Text(
        //                                           AppLocalizations.of(context)!
        //                                               .translate("yes")!),
        //                                     ),
        //                                   ],
        //                                 );
        //                               });
        //                         }),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       SizedBox(
        //         height: 20,
        //       ),
        //     ],
        //   ),
        // );
        return Scaffold(
          appBar: AppBar(
            elevation: 0.4,
            toolbarHeight: size.height * 0.1,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark),
            title: Text('ACCOUNT',
                style: TextStyle(
                    fontFamily: 'btb',
                    color: app_color,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
                textScaleFactor: 1),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 100,
                          child: BlocProvider.of<AccountBloc>(context)
                                      .accountModel!
                                      .image ==
                                  null
                              ? CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                    "assets/icon/avartar.png",
                                  ),
                                  radius: 50.0,
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(
                                    "${BlocProvider.of<AccountBloc>(context).accountModel!.image}",
                                  ),
                                  radius: 50.0,
                                ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                                "${BlocProvider.of<AccountBloc>(context).accountModel!.name}",
                                style: TextStyle(
                                    fontFamily: 'btb',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                                textScaleFactor: 1.2),
                                SizedBox(height: 8,),
                            Text(
                                "${BlocProvider.of<AccountBloc>(context).accountModel!.phone}",
                                style: TextStyle(
                                    fontFamily: 'btb',
                                    color: Colors.black,
                                    // fontWeight: FontWeight.bold,
                                   ),
                                textScaleFactor: 1.1),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _builContainer(
      {required String title,
      required Color iconColor,
      required IconData iconData,
      required Function? onTap}) {
    return Container(
        child: ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: iconColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(title),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        size: 30.0,
      ),
      onTap: onTap as void Function()?,
    ));
  }

  contactUsModal(context) {
    _tile({
      required String title,
      required Function onTap,
      required IconData iconData,
    }) =>
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).buttonColor,
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(iconData, color: Theme.of(context).primaryColor),
                Text(
                  title,
                  textScaleFactor: 0.9,
                  textAlign: TextAlign.start,
                  // null safety error
                  // style: TextStyle(
                  //     color: Theme.of(context).textTheme.headline1.color)
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headline1?.color),
                ),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
        );
    _cancelTile() => GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).buttonColor,
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            width: double.infinity,
            child: Center(
              child: Text(
                "Cancel",
                textScaleFactor: 1.1,
                textAlign: TextAlign.start,
                style: TextStyle(
                    letterSpacing: 0.5, color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        );
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: true,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            margin: EdgeInsets.all(15),
            decoration: new BoxDecoration(
                color: Colors.transparent,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(10.0),
                  topRight: const Radius.circular(10.0),
                )),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                _tile(
                    title: "(Tel) 099666819",
                    iconData: Icons.call,
                    onTap: () {
                      launch("tel://099666819",
                          forceSafariVC: false, forceWebView: false);
                    }),
                Container(
                  color: Colors.transparent,
                  height: 10,
                ),
                // _tile(
                //     title: "(Telegram) Opentech",
                //     iconData: MdiIcons.transfer,
                //     onTap: () {
                //       launch("https://t.me/opentechedx");
                //     }),
                Container(
                  height: 10,
                ),
                _tile(
                    title: "(Website) asiaworldcambodia.com",
                    iconData: Icons.public,
                    onTap: () {
                      launch("http://www.asiaworldcambodia.com/");
                    }),
                Container(
                  color: Colors.transparent,
                  height: 10,
                ),
                _tile(
                    title: "(Facebook) ASIA World ពិភពបង់រំលោះ",
                    iconData: MdiIcons.facebook,
                    onTap: () {
                      launch("https://m.me/asiaworldcambodia",
                          forceSafariVC: false, forceWebView: false);
                    }),
                Container(
                  color: Colors.transparent,
                  height: 10,
                ),
                _cancelTile()
              ],
            ),
          );
        });
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
}
