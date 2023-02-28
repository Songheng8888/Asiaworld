import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:royal_landapp/src/feature/myproperty/screen/add_property.dart';

import 'shipping_address_page.dart';
import 'widgets/address_detail_field.dart';
import 'widgets/btn_choose_locaion.dart';
// import 'widgets/form/form.dart' as widget;

class AddressFormPage extends StatefulWidget {
  AddressFormPage();
  @override
  AddressFormPageState createState() => AddressFormPageState();
}

class AddressFormPageState extends State<AddressFormPage> {
  static final TextEditingController addressDetailTextController =
      TextEditingController();
  static String lat = "";
  static String long = "";
  static String city = "";
  String? address;

  // static AddressFormBloc addressFormBloc = AddressFormBloc();
  @override
  void initState() {
    addressDetailTextController.text = "";
    lat = "";
    long = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:
            PreferredSize(preferredSize: Size.fromHeight(56), child: appBar()),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 0),
                alignment: Alignment.topLeft,
                child: Text(
                  "Add address",
                  //AppLocalizations.of(context)!.translate("language"),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                  textScaleFactor: 1.8,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: AspectRatio(
                      aspectRatio: 7 / 4, child: addressDetailField(context))),
              SizedBox(
                height: 10,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: AspectRatio(
                      aspectRatio: 9 / 1.6, child: btnChooseLocation())),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // addressFormBloc.close();
    super.dispose();
  }
}

Widget appBar() => Builder(
    builder: (context) => AppBar(
          brightness: Brightness.light,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.red[300],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.blue[300],
              ),
              onPressed: () {
                if (AddressFormPageState.lat.length == 0) {
                  // CoolAlert.show(
                  //     title: "Please choose location",
                  //     context: context,
                  //     type: CoolAlertType.info);
                } else {
                  AddPropertyPageState.lat = AddressFormPageState.lat;
                  AddPropertyPageState.long = AddressFormPageState.long;
                  String data = AddressFormPageState.lat +
                      "/" +
                      AddressFormPageState.long;
                  print("lat ${AddressFormPageState.lat}");
                  print("lat ${AddressFormPageState.long}");
                  print(data);
                  Navigator.of(context).pop(data);
                  // AddPropertyPageState.locationCtrl.text =
                  //     AddressFormPageState.addressDetailTextController.text;
                  // shippingAddressBloc.add(AddAddressStarted(
                  //     name: "1",
                  //     lat: AddressFormPageState.lat,
                  //     long: AddressFormPageState.long,
                  //     description: AddressFormPageState
                  //             .addressDetailTextController.text +
                  //         " (${AddressFormPageState.city})"));
                }
              },
            )
          ],
        ));
