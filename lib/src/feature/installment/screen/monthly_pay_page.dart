import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:royal_landapp/src/constants/app_constant.dart';
import 'package:royal_landapp/src/feature/account/bloc/index.dart';
import 'package:royal_landapp/src/shared/bloc/file_pickup/file_pickup_bloc.dart';
import 'package:royal_landapp/src/shared/bloc/index/index_bloc.dart';
import 'package:royal_landapp/src/shared/widget/error_snackbar.dart';
import 'package:royal_landapp/src/shared/widget/standard_appbar.dart';
import 'package:royal_landapp/src/utils/share/helper.dart';

class MonthlyPayment extends StatefulWidget {
  const MonthlyPayment({Key? key}) : super(key: key);

  @override
  State<MonthlyPayment> createState() => _MonthlyPaymentState();
}

class _MonthlyPaymentState extends State<MonthlyPayment> {
  final TextEditingController _fNameCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _lnameCtrl = TextEditingController();
  final TextEditingController _companyCtrl = TextEditingController();
  final TextEditingController _ageCtrl = TextEditingController();
  final TextEditingController _addressCtrl = TextEditingController();
  final TextEditingController _salaryCtrl = TextEditingController();
  final TextEditingController _educCtrl = TextEditingController();
  final TextEditingController _experienceCtrl = TextEditingController();

  File? _image;
  FilePickupBloc? _filePickupBloc;
  IndexBloc? paymentTypeIndexingBloc;
  IndexBloc? paymentMethodIndexingBloc;
  late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  AccountBloc _accountBloc = AccountBloc();
  @override
  void initState() {
    super.initState();
    _filePickupBloc = FilePickupBloc();
    paymentTypeIndexingBloc = IndexBloc();
    paymentMethodIndexingBloc = IndexBloc();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: standardAppBar(context, "Apply Installment"),
      appBar: AppBar(
        elevation: 0.4,
        toolbarHeight: size.height * 0.1,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back, color: app_color)),
        title: Text(
          "Apply Installment",
          style: TextStyle(fontFamily: 'kh', color: app_color),
          textScaleFactor: 1,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: BlocListener(
        bloc: _accountBloc,
        listener: (context, state) {
          if (state is UpdatingAccount) {
            EasyLoading.show(status: 'loading...');
          }
          if (state is ErrorUpdatingAccount) {
            EasyLoading.dismiss();
            errorSnackBar(text: state.error.toString(), context: context);
          }
          if (state is UpdatedAccount) {
            EasyLoading.dismiss();
            EasyLoading.showToast('Success');
            Navigator.pop(context);
            _accountBloc.add(FetchAccountStarted());
          }
        },
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 8, right: 8),
              margin:
                  EdgeInsets.only(bottom: 10.0, left: 8.0, right: 8.0, top: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.white,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.5),
                //     spreadRadius: 0,
                //     blurRadius: 3,
                //     offset: Offset(0, 0), // changes position of shadow
                //   ),
                // ],
              ),
              child: Container(
                // color: app_color,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      // mainAxisAlignment: CrossAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "លោកអ្នកអាចធ្វើការបង់ប្រាក់តាមរយៈគណនីណាមួយដូចខាងក្រោម ៖",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'kh'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "  - គណនី ABA : លេខ​ ៖ 010601168 / ឈ្មោះ​ ៖ Sim Sophea ",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'kh'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "  - គណនី Aceleda : លេខ​ ៖ 010601168 / ឈ្មោះ​ ៖ Sim Sophea ",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'kh'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "  -​ លេខទូរសព្ទ័ Wing,TrueMoney,EMoney : លេខ​ ៖ 010601168  ",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'kh'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "បន្ទាប់មកសូមថតបង្កាន់ដៃដែលបានបង់រួច uploadក្នុងរូបថតខាងក្រោមដើម្បីយើងខ្ញុំធ្វើការប្រតិបត្តិការជូន!",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'kh'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "បំពេញពត៌មានខាងក្រោម",
                textScaleFactor: 1.4,
              ),
            ),
            Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Firt name",
                        textScaleFactor: 1.1,
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormField(
                      controller: _fNameCtrl,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.grey.shade400)),
                          enabledBorder: InputBorder.none,
                          contentPadding: const EdgeInsets.only(
                            left: 14.0,
                          ),
                          labelText: "ex. Kouy"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name is required.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text("Last Name",
                          textScaleFactor: 1.1,
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                    TextFormField(
                      controller: _lnameCtrl,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.grey.shade400)),
                          enabledBorder: InputBorder.none,
                          contentPadding: const EdgeInsets.only(
                            left: 14.0,
                          ),
                          labelText: "ex. Sinit"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Last name is required.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text("Address",
                          textScaleFactor: 1.1,
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                    TextFormField(
                      controller: _addressCtrl,
                      maxLines: null,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.grey.shade400)),
                          enabledBorder: InputBorder.none,
                          contentPadding: const EdgeInsets.only(
                            left: 14.0,
                          ),
                          labelText: "ex. Phnom Penh"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Address is required.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text("Age",
                          textScaleFactor: 1.1,
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                    TextFormField(
                      controller: _ageCtrl,
                      maxLines: null,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.grey.shade400)),
                          enabledBorder: InputBorder.none,
                          contentPadding: const EdgeInsets.only(
                            left: 14.0,
                          ),
                          labelText: "ex. 25"),
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text("Company name",
                          textScaleFactor: 1.1,
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                    TextFormField(
                      controller: _companyCtrl,
                      maxLines: null,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.grey.shade400)),
                          enabledBorder: InputBorder.none,
                          // isDense: true,
                          contentPadding: const EdgeInsets.only(
                            left: 14.0,
                          ),
                          labelText: "ex. 25"),
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text("Salary Range",
                          textScaleFactor: 1.1,
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                    TextFormField(
                      controller: _salaryCtrl,
                      maxLines: null,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.grey.shade400)),
                          enabledBorder: InputBorder.none,
                          contentPadding: const EdgeInsets.only(
                            left: 14.0,
                          ),
                          labelText: "ex. 200"),
                    ),
                    SizedBox(height: 30),
                    BlocBuilder(
                      bloc: paymentTypeIndexingBloc,
                      builder: (context, state) {
                        if (state != 0) {
                          return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Upload  Image',
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
                    Container(
                      margin: EdgeInsets.only(
                          left: 10, right: 10, bottom: 10, top: 20),
                      height: 50,
                      width: double.infinity,
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Colors.redAccent,
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Submit",
                            textScaleFactor: 1.2,
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
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
