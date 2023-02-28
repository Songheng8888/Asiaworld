import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/account/bloc/account_bloc.dart';
import 'package:royal_landapp/src/feature/account/bloc/account_event.dart';
import 'package:royal_landapp/src/feature/account/bloc/account_state.dart';
import 'package:royal_landapp/src/feature/account/model/acc_model.dart';
import 'package:royal_landapp/src/feature/account/screen/widget/payment_method.dart';
import 'package:royal_landapp/src/shared/bloc/file_pickup/file_pickup_bloc.dart';
import 'package:royal_landapp/src/shared/bloc/index/index_bloc.dart';
import 'package:royal_landapp/src/shared/bloc/index/index_event.dart';
import 'package:royal_landapp/src/shared/widget/customer_dialog.dart';
import 'package:royal_landapp/src/shared/widget/error_snackbar.dart';
import 'package:royal_landapp/src/shared/widget/loadin_dialog.dart';
import 'package:royal_landapp/src/utils/share/appbar.dart';
import 'package:royal_landapp/src/utils/share/helper.dart';

import '../../../appLocalizations.dart';

class UpgradePage extends StatefulWidget {
  final String subscriptionId;
  final AccountModel accountModel;
  const UpgradePage({required this.accountModel, required this.subscriptionId});

  @override
  _UpgradePageState createState() => _UpgradePageState();
}

class _UpgradePageState extends State<UpgradePage> {
  final TextEditingController _fNameCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _cityCtrl = TextEditingController();
  final TextEditingController _companyCtrl = TextEditingController();
  final TextEditingController _addressCtrl = TextEditingController();

  File? _image;
  IndexBloc? paymentTypeIndexingBloc;
  IndexBloc? paymentMethodIndexingBloc;
  FilePickupBloc? _filePickupBloc;

  // final _dateCtrl = TextEditingController();
  //     TextEditingController();
  late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _fNameCtrl.text = widget.accountModel.name;
    _phoneCtrl.text = widget.accountModel.phone;
    _emailCtrl.text = widget.accountModel.email;

    super.initState();
    paymentTypeIndexingBloc = IndexBloc();
    paymentMethodIndexingBloc = IndexBloc();
    _filePickupBloc = FilePickupBloc();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.subscriptionId);
    return Scaffold(
      appBar: standardAppBar(context, ""),
      body: BlocListener<AccountBloc, AccountState>(
        listener: (context, state) {
          if (state is UpgradingAccount) {
            loadingDialogs(context);
          }
          if (state is ErrorUpdatingAccount) {
            Navigator.pop(context);
            errorSnackBar(text: state.error.toString(), context: context);
          }
          if (state is UpgradedAccount) {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
            BlocProvider.of<AccountBloc>(context).add(FetchAccountStarted());
            print("suuces");
          }
        },
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    // TextFormField(
                    //   controller: _fNameCtrl,
                    //   keyboardType: TextInputType.text,
                    //   decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.all(15),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(
                    //           Radius.circular(5.0),
                    //         ),
                    //         borderSide: new BorderSide(
                    //           width: 1,
                    //         ),
                    //       ),
                    //       isDense: true,
                    //       labelText: "Name"),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Name is required.';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // SizedBox(height: 15),
                    // TextFormField(
                    //   controller: _emailCtrl,
                    //   keyboardType: TextInputType.text,
                    //   decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.all(15),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(
                    //           Radius.circular(5.0),
                    //         ),
                    //         borderSide: new BorderSide(
                    //           width: 1,
                    //         ),
                    //       ),
                    //       isDense: true,
                    //       labelText: "Email"),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Phone Number is required.';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // SizedBox(height: 15),
                    // TextFormField(
                    //   controller: _phoneCtrl,
                    //   keyboardType: TextInputType.text,
                    //   decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.all(15),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(
                    //           Radius.circular(5.0),
                    //         ),
                    //         borderSide: new BorderSide(
                    //           width: 1,
                    //         ),
                    //       ),
                    //       isDense: true,
                    //       labelText: "Phone Number"),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Phone Number is required.';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // SizedBox(height: 15),
                    // TextFormField(
                    //   controller: _cityCtrl,
                    //   keyboardType: TextInputType.text,
                    //   decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.all(15),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(
                    //           Radius.circular(5.0),
                    //         ),
                    //         borderSide: new BorderSide(
                    //           width: 1,
                    //         ),
                    //       ),
                    //       isDense: true,
                    //       labelText: "City"),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Phone Number is required.';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // SizedBox(height: 15),
                    // TextFormField(
                    //   controller: _companyCtrl,
                    //   keyboardType: TextInputType.text,
                    //   decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.all(15),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(
                    //           Radius.circular(5.0),
                    //         ),
                    //         borderSide: new BorderSide(
                    //           width: 1,
                    //         ),
                    //       ),
                    //       isDense: true,
                    //       labelText: "Company"),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Phone Number is required.';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // SizedBox(height: 15),
                    // TextFormField(
                    //   controller: _addressCtrl,
                    //   keyboardType: TextInputType.text,
                    //   decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.all(15),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(
                    //           Radius.circular(5.0),
                    //         ),
                    //         borderSide: new BorderSide(
                    //           width: 1,
                    //         ),
                    //       ),
                    //       isDense: true,
                    //       labelText: "Address"),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Address is required.';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // SizedBox(height: 15),
                    // Container(
                    //   padding: EdgeInsets.only(top: 10),
                    //   child: Center(child: Text("រូបថត")),
                    // ),
                    SizedBox(height: 15),
                    BlocProvider<IndexBloc>(
                      create: (BuildContext context) =>
                          paymentMethodIndexingBloc!,
                      child: BlocBuilder(
                        bloc: paymentTypeIndexingBloc,
                        builder: (c, state) {
                          if (state == 0) {
                            return Container(
                              child: Text('Error'),
                            );
                          } else {
                            paymentMethodIndexingBloc?.add(Taped(index: -1));
                            return _paymentMethodWidget(context);
                          }
                        },
                      ),
                    ),
                    BlocBuilder(
                      bloc: paymentTypeIndexingBloc,
                      builder: (context, state) {
                        if (state != 0) {
                          return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  // color: Theme.of(context).buttonColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // 'Upload Transaction Image',
                                    AppLocalizations.of(context)!
                                        .translate("uploadTransactionImage")!,
                                    style: TextStyle(
                                        fontFamily: 'BattambangRegular'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(),
                                  GestureDetector(
                                    onTap: () {
                                      _showPicker(context);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.width / 3,
                                      child: AspectRatio(
                                          aspectRatio: 1,
                                          child: BlocBuilder(
                                            bloc: _filePickupBloc,
                                            builder: (context, dynamic state) {
                                              return FittedBox(
                                                  fit: BoxFit.fitHeight,
                                                  child: (state == null)
                                                      ? Icon(
                                                          Icons
                                                              .add_a_photo_outlined,
                                                          color:
                                                              Colors.grey[300],
                                                        )
                                                      : Image.file(state));
                                            },
                                          )),
                                    ),
                                  )
                                ],
                              ));
                        }
                        return Container();
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
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
              if (_formKey!.currentState!.validate()) {
                if (_filePickupBloc!.state == null) {
                  customDialog(
                      context,
                      "",
                      Text(
                        "Please Upload Image",
                        // AppLocalizations.of(context)
                        //     .translate("pleaseChooseTransImage"),
                        style: TextStyle(fontFamily: 'BattambangRegular'),
                      ),
                      () {});
                } else {
                  print(widget.subscriptionId);
                  BlocProvider.of<AccountBloc>(context).add(
                      UpgradeAccountStarted(
                          subscriptionId: widget.subscriptionId,
                          paymentMethod: paymentMethodList[
                              paymentMethodIndexingBloc!.state]["name"],
                          imageUrl: _filePickupBloc!.state));
                }
              }
            },
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Submit",
              // AppLocalizations.of(context)!.translate("submit")!,
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }

  _paymentMethodWidget(BuildContext contextt) {
    return Builder(
      builder: (c) {
        return BlocBuilder(
          bloc: BlocProvider.of<IndexBloc>(c),
          builder: (context, dynamic state) {
            return GestureDetector(
              onTap: () {
                paymentMethodDialog(c);
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin: EdgeInsets.only(bottom: 15),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          // "chooseTransfermethod",
                          AppLocalizations.of(context)!
                              .translate("chooseTransfermethod")!,
                          style: TextStyle(fontFamily: 'BattambangRegular')),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      (paymentMethodIndexingBloc?.state == (-1))
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  // "Choose here",
                                  AppLocalizations.of(context)!
                                      .translate("choosehere")!,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontFamily: 'BattambangRegular'),
                                ),
                                Icon(Icons.arrow_drop_down)
                              ],
                            )
                          : Row(
                              children: [
                                Expanded(
                                  flex: 20,
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Image(
                                      // width: 15,
                                      // height: 15,
                                      image: AssetImage(
                                          paymentMethodList[state]["image"]),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    flex: 80,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(paymentMethodList[state]["name"],
                                            textScaleFactor: 1.1),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            paymentMethodList[state]
                                                ["description"],
                                            textScaleFactor: 1.1),
                                      ],
                                    )),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                    ],
                  )),
            );
          },
        );
      },
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text(
                        'Photo Library',
                        style: TextStyle(fontFamily: 'BattambangRegular'),
                      ),
                      onTap: () {
                        Helper.imgFromGallery((image) {
                          _filePickupBloc?.add(image);
                        });
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text(
                      'Camera',
                      style: TextStyle(fontFamily: 'BattambangRegular'),
                    ),
                    onTap: () {
                      Helper.imgFromCamera((image) {
                        _filePickupBloc?.add(image);
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
