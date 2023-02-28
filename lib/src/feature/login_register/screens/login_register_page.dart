import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/login_register/bloc/login/index.dart';
import 'package:royal_landapp/src/feature/login_register/bloc/otp/index.dart';
import 'package:royal_landapp/src/feature/login_register/bloc/register/index.dart';
import 'package:royal_landapp/src/feature/login_register/screens/widgets/login_form.dart';
import 'package:royal_landapp/src/feature/login_register/screens/widgets/login_holder.dart';

import '../../../appLocalizations.dart';
import 'widgets/register_form.dart';

class LoginRegisterPage extends StatefulWidget {
  LoginRegisterPage({this.isLogin = true});
  final bool isLogin;
  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  bool? isLogin;
  @override
  void initState() {
    if (isLogin == null) {
      isLogin = widget.isLogin;
    } else {
      isLogin = widget.isLogin;
    }
    print(isLogin);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(isLogin);
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (BuildContext context) => LoginBloc()),
        BlocProvider<RegisterBloc>(
            create: (BuildContext context) => RegisterBloc()),
      ],
      child: Scaffold(
        body: Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          alignment: Alignment.center,
          child: ListView(
            children: [
              logoHolder(),
              SizedBox(
                height: 25,
              ),
              isLogin! == true
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Text(
                            AppLocalizations.of(context)!
                                .translate("loginToYourAccount")!,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'BattambangRegular'),
                            textScaleFactor: 2,
                          ),
                          SizedBox(height: 20),
                          LoginForm(),
                          SizedBox(height: 20),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLogin = false;
                                });
                              },
                              child: Column(
                                children: [
                                  // InkWell(
                                  //   onTap: () {
                                  //     Navigator.push(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //             builder: (con) =>
                                  //                 ForgetPassword()));
                                  //   },
                                  //   child: Container(
                                  //     padding:
                                  //         EdgeInsets.only(top: 10, bottom: 10),
                                  //     child: Text(
                                  //       AppLocalizations.of(context)!
                                  //           .translate("forgotPassword")!,
                                  //       style: TextStyle(color: Colors.amberAccent[700]),
                                  //     ),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .translate("donothaveaccount")!,
                                        textScaleFactor: 1.3,
                                        style: TextStyle(
                                            fontFamily: 'BattambangRegular'),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .translate("register")!,
                                          textScaleFactor: 1.3,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontFamily: 'BattambangRegular'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                        ])
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Text(
                            AppLocalizations.of(context)!.translate("create")!,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'BattambangRegular'),
                            textScaleFactor: 2,
                          ),
                          SizedBox(height: 20),
                          RegisterForm(),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isLogin = true;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate("alreadyhaveaccount")!,
                                  textScaleFactor: 1.3,
                                  style: TextStyle(
                                      fontFamily: 'BattambangRegular'),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .translate("login")!,
                                    textScaleFactor: 1.3,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontFamily: 'BattambangRegular'),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ])
            ],
          ),
        ),
      ),
    );
  }
}
