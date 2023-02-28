import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:royal_landapp/src/feature/auth/bloc/index.dart';
import 'package:royal_landapp/src/feature/login_register/bloc/register/index.dart';
import 'package:royal_landapp/src/shared/widget/error_snackbar.dart';
import '../../../../appLocalizations.dart';
import '../verify_opt_page.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late TextEditingController? _phoneNumberController = TextEditingController();
  late TextEditingController? _passwordController = TextEditingController();
  late TextEditingController? _nameController = TextEditingController();
  late TextEditingController? _emailCtrl = TextEditingController();
  late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, dynamic state) {
        if (state is Registering) {
          EasyLoading.show(status: "loading...");
        } else if (state is ErrorRegistering) {
          EasyLoading.dismiss();
          errorSnackBar(text: state.error.toString(), context: context);
        } else if (state is Registered) {
          EasyLoading.dismiss();

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VerifyOtpPage(
                      token: state.userModel.token,
                      isLogin: true,
                      email: state.userModel.email!,
                      ref: state.userModel.ref!)));
        }
      },
      child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.text,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1.0),
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
                  labelText: AppLocalizations.of(context)!.translate("name")),
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!
                      .translate("nameRequired");
                }
                return null;
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.number,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1.0),
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
                  labelText: AppLocalizations.of(context)!.translate("phone")),
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!
                      .translate("phoneNumberRequired");
                }
                return null;
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _emailCtrl,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1.0),
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
                  labelText: "Email Address"),
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!
                      .translate("phoneNumberRequired");
                }
                return null;
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.text,
              controller: _passwordController,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1.0),
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
                  labelText:
                      AppLocalizations.of(context)!.translate("password")),
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!
                      .translate("passRequired");
                } else if (value.length < 8) {
                  return AppLocalizations.of(context)!
                      .translate("passwordLength");
                }
                return null;
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.text,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1.0),
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
                  labelText: AppLocalizations.of(context)!
                      .translate("confirmPassword")),
              validator: (value) {
                // if (value!.isEmpty || value != _passwordController!.text) {
                //   return AppLocalizations.of(context)!
                //       .translate("falseConfirmPass");
                // }
                return null;
              },
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.only(left: 5, right: 5),
              height: 50,
              width: double.infinity,
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    // side: BorderSide(color: Colors.red)
                  ),
                  color: Colors.red,
                  onPressed: () {
                    if (_formKey!.currentState!.validate()) {
                      BlocProvider.of<RegisterBloc>(context).add(
                          RegisterPressed(
                              email: _emailCtrl!.text,
                              name: _nameController!.text,
                              phoneNumber: _phoneNumberController!.text,
                              password: _passwordController!.text));
                    }
                  },
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "${AppLocalizations.of(context)!.translate("register")}",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.white),
                  )),
            )
            // pressButton(
            //     context: context,
            //     title: "${AppLocalizations.of(context)!.translate("register")}",
            //     onTap: () {
            //       if (_formKey!.currentState!.validate()) {
            //         BlocProvider.of<RegisterBloc>(context).add(RegisterPressed(
            //             name: _nameController!.text,
            //             phoneNumber: _phoneNumberController!.text,
            //             password: _passwordController!.text));
            //       }
            //        else {
            //         errorSnackBar(
            //             text: "Please input all fields", context: context);
            //       }
            //     })
            // Container(
            //   width: double.infinity,
            //   child: FlatButton(
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(5),
            //         // side: BorderSide(color: Colors.red)
            //       ),
            //       color: Colors.blue,
            //       onPressed: () {
            //         if (_formKey.currentState.validate()) {
            //           BlocProvider.of<RegisterBloc>(context).add(
            //               RegisterPressed(
            //                   name: _nameController.text,
            //                   phoneNumber: _phoneNumberController.text,
            //                   password: _passwordController.text));
            //         }
            //       },
            //       padding: EdgeInsets.symmetric(vertical: 10),
            //       child: Text(
            //         AppLocalizations.of(context).translate("register"),
            //         textScaleFactor: 1.2,
            //         style: TextStyle(
            //           color: Colors.white,
            //         ),
            //       )),
            // ),
          ])),
    );
  }
}
