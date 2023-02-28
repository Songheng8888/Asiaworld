import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:royal_landapp/src/appLocalizations.dart';
import 'package:royal_landapp/src/feature/auth/bloc/index.dart';
import 'package:royal_landapp/src/feature/auth/model/user_model.dart';
import 'package:royal_landapp/src/feature/login_register/bloc/otp/index.dart';
import 'package:royal_landapp/src/shared/widget/error_snackbar.dart';

class VerifyOtpPage extends StatelessWidget {
  final dynamic token;
  final bool? isLogin;
  final String email;
  final String ref;
  const VerifyOtpPage(
      {required this.isLogin,
      required this.email,
      required this.ref,
      required this.token});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        email: email,
        isLogin: isLogin!,
        ref: ref,
        token: token,
      ),
    );
  }
}

class Body extends StatefulWidget {
  final bool isLogin;
  final String email;
  final String ref;
  final dynamic token;
  const Body(
      {required this.isLogin,
      required this.email,
      required this.ref,
      required this.token});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late TextEditingController? textEditingController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  int _counter = 60;
  late Timer _timer;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter--;
        if (_counter <= 0) {
          _timer.cancel();
        }
      });
    });
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocListener(
          bloc: BlocProvider.of<VerifyOptBloc>(context),
          listener: (context, state) {
            if (state is VerifyingOtp) {
              EasyLoading.show(status: 'loading...');
            }
            if (state is ResendingVerifyOtp) {
              EasyLoading.show(status: 'loading...');
            }
            if (state is ResentVerifiedOpt) {
              EasyLoading.dismiss();
            }
            if (state is ErrorVerifyOtp) {
              EasyLoading.dismiss();
              errorSnackBar(text: state.error.toString(), context: context);
            }
            if (state is VerifiedOtp) {
              EasyLoading.dismiss();
              BlocProvider.of<AuthenticationBloc>(context).add(
                  AuthenticationStarted(
                      user: UserModel(
                          id: "",
                          token: widget.token,
                          email: "",
                          ref: "",
                          verifyStatus: ""),
                      token: widget.token));
              EasyLoading.showSuccess('Success');
              Navigator.pop(context);
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 25,
                                child: Center(),
                              ),
                              Expanded(
                                flex: 50,
                                child: FittedBox(
                                  child: Icon(
                                    Icons.sms_outlined,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 25,
                                child: Center(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .translate("phoneVerification")!,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textScaleFactor: 1.6,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 8),
                            child: RichText(
                              text: TextSpan(
                                  text:
                                      "${AppLocalizations.of(context)!.translate("weSentCode")!}",
                                  children: [
                                    TextSpan(
                                        text: "${widget.email}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          PinCodeTextField(
                            keyboardType: TextInputType.number,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            cursorColor: Colors.grey[200],
                            length: 4,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                              selectedColor: Colors.grey,
                              inactiveColor: Colors.grey[300],
                              activeColor: Colors.grey[200],
                              shape: PinCodeFieldShape.underline,
                              fieldHeight: 50,
                              fieldWidth: 50,
                            ),
                            animationDuration: Duration(milliseconds: 300),
                            backgroundColor: Colors.white,
                            controller: textEditingController!,
                            onCompleted: (v) {
                              print(textEditingController!.text);
                              BlocProvider.of<VerifyOptBloc>(context).add(
                                  VerifyOptPressedStarted(
                                      token: widget.token,
                                      ref: widget.ref,
                                      text: textEditingController!.text));
                            },
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                currentText = value;
                              });
                            },
                            beforeTextPaste: (text) {
                              return true;
                            },
                            appContext: context,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _counter == 0
                                  ? Text("")
                                  : Text(
                                      "$_counter",
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 15),
                                    ),
                              SizedBox(width: 10),
                              _counter == 0
                                  ? Container(
                                      margin: EdgeInsets.only(top: 30),
                                      width: 150,
                                      height: 40,
                                      child: FlatButton(
                                        color: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        onPressed: () {
                                          BlocProvider.of<VerifyOptBloc>(
                                                  context)
                                              .add(ResendVerifyOtpStarted(
                                                  token: widget.token));
                                          print(
                                              "resend otp to ${widget.email} ");
                                          _counter = 60;

                                          _startTimer();
                                        },
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .translate("resendCode")!,
                                          textScaleFactor: 1.3,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Text(
                                      AppLocalizations.of(context)!
                                          .translate("resendCode")!,
                                      textScaleFactor: 1.3,
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.4),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ));
    });
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }
}
