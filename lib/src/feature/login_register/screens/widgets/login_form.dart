import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/auth/bloc/index.dart';
import 'package:royal_landapp/src/feature/login_register/bloc/login/index.dart';
import 'package:royal_landapp/src/feature/login_register/bloc/otp/index.dart';
import 'package:royal_landapp/src/shared/widget/error_snackbar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../appLocalizations.dart';
import '../verify_opt_page.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController? _phoneNumberController = TextEditingController();
  late TextEditingController? _passwordController = TextEditingController();
  late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  dynamic _token;
  String? _email;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, dynamic state) {
        if (state is Logging) {
          EasyLoading.show(status: "loading...");
        } else if (state is Logged) {
          EasyLoading.dismiss();
          if (state.userModel.verifyStatus == "pending") {
            _token = state.userModel.token;
            _email = state.userModel.email;
            print(_token);
            BlocProvider.of<VerifyOptBloc>(context)
                .add(ResendVerifyOtpStarted(token: state.userModel.token));
          } else {
            BlocProvider.of<AuthenticationBloc>(context).add(
                AuthenticationStarted(
                    user: state.userModel, token: state.userModel.token));
          }
        } else if (state is ErrorLogin) {
          EasyLoading.dismiss();
          errorSnackBar(text: state.error.toString(), context: context);
        }
      },
      child: BlocListener<VerifyOptBloc, VerifyOtpState>(
        listener: (context, state) {
          if (state is ResendingVerifyOtp) {
            EasyLoading.show(status: 'loading');
          }
          if (state is ErrorVerifyOtp) {
            EasyLoading.dismiss();
            errorSnackBar(text: state.error.toString(), context: context);
          }
          if (state is ResentVerifiedOpt) {
            EasyLoading.dismiss();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VerifyOtpPage(
                        token: _token,
                        isLogin: true,
                        email: _email!,
                        ref: state.ref)));
          }
        },
        child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              TextFormField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.red,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.red, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: new BorderSide(
                        width: 1,
                      ),
                    ),
                    labelStyle: TextStyle(color: Colors.grey),
                    labelText: "Email"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!
                        .translate("phoneNumberRequired");
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.red,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.red, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: new BorderSide(
                        width: 1,
                      ),
                    ),
                    isDense: true,
                    labelStyle: TextStyle(color: Colors.grey),
                    labelText:
                        AppLocalizations.of(context)!.translate("password")),
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!
                        .translate("passRequired");
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 50),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                height: 50,
                width: double.infinity,
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.red,
                    onPressed: () {
                      if (_formKey!.currentState!.validate()) {
                        BlocProvider.of<LoginBloc>(context).add(LoginPressed(
                            phoneNumber: _phoneNumberController!.text,
                            password: _passwordController!.text));
                      }
                    },
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "${AppLocalizations.of(context)!.translate("login")}",
                      textScaleFactor: 1.2,
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ])),
      ),
    );
  }
}
