import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmOptPage extends StatefulWidget {
  @override
  _ConfirmOptPageState createState() => _ConfirmOptPageState();
}

class _ConfirmOptPageState extends State<ConfirmOptPage> {
  TextEditingController textEditingController = TextEditingController();
  // VerifyOptBloc? verifyOptBloc;

  // StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  int _counter = 60;
  late Timer _timer;

  @override
  void initState() {
    // errorController = StreamController<ErrorAnimationType>();
    // verifyOptBloc.
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    // errorController!.close();

    super.dispose();
  }

  void _startTimer() {
    // _counter = 10;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter--;
        if (_counter <= 0) {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
          ),
          elevation: 0,
          // title: Text(
          //   "Verify your phone number",
          //   style: TextStyle(color: Colors.black),
          // ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Center(
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
                                    color: Colors.orange,
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
                            "Phone Number Verification",
                            // AppLocalizations.of(context)
                            //     .translate("phoneVerification"),
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
                                  text: "Enter the code sent to ",
                                  children: [
                                    TextSpan(
                                        text: "017415213",
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
                          // SizedBox(
                          //   height: 100,
                          // ),
                          PinCodeTextField(
                            keyboardType: TextInputType.number,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            cursorColor: Colors.grey[200],
                            length: 4,
                            obscureText: false,
                            animationType: AnimationType.fade,

                            pinTheme: PinTheme(
                              selectedColor: Colors.grey,
                              // selectedFillColor: Colors.white,
                              inactiveColor: Colors.grey[300],
                              // disabledColor: Colors.grey,
                              activeColor: Colors.grey[200],
                              //inactiveFillColor: Colors.purple,
                              shape: PinCodeFieldShape.underline,
                              //  borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              fieldWidth: 50,
                              // activeFillColor: Colors.grey[200],
                            ),
                            animationDuration: Duration(milliseconds: 300),
                            backgroundColor: Colors.white,
                            // enableActiveFill: true,
                            // errorAnimationController: errorController,
                            controller: textEditingController,
                            onCompleted: (v) {},
                            onChanged: (value) {},
                            beforeTextPaste: (text) {
                              print("Allowing to paste ");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
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
                              // Text(
                              //   "Didn't receive the code? ",
                              //   style: TextStyle(color: Colors.black54, fontSize: 15),
                              // ),
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
                                        onPressed: () {},
                                        child: Text(
                                          "Resend code",
                                          textScaleFactor: 1.3,
                                          style: TextStyle(
                                            color: Colors.white,
                                            // color: Color(0xFF91D3B3),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Text(
                                      "Resend code",
                                      textScaleFactor: 1.3,
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.4),
                                        // color: Color(0xFF91D3B3),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                            ],
                          ),

                          // SizedBox(
                          //   height: 40,
                          // ),
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
          ),
        ));
  }
}
