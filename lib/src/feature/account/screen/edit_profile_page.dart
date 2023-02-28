import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:royal_landapp/src/appLocalizations.dart';
import 'package:royal_landapp/src/feature/account/bloc/account_bloc.dart';
import 'package:royal_landapp/src/feature/account/bloc/index.dart';
import 'package:royal_landapp/src/feature/account/model/acc_model.dart';
import 'package:royal_landapp/src/shared/bloc/file_pickup/file_pickup_bloc.dart';
import 'package:royal_landapp/src/shared/bloc/index/index_bloc.dart';
import 'package:royal_landapp/src/shared/widget/appbar_add_edit.dart';
import 'package:royal_landapp/src/shared/widget/customer_dialog.dart';
import 'package:royal_landapp/src/shared/widget/error_snackbar.dart';
import 'package:royal_landapp/src/shared/widget/loadin_dialog.dart';
import 'package:royal_landapp/src/utils/share/appbar.dart';
import 'package:royal_landapp/src/utils/share/helper.dart';

class EditProfilePage extends StatefulWidget {
  final AccountModel accountModel;
  const EditProfilePage({required this.accountModel});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _fNameCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _companyCtrl = TextEditingController();
  final TextEditingController _cityCtrl = TextEditingController();
  final TextEditingController _addressCtrl = TextEditingController();
  final TextEditingController _skillCtrl = TextEditingController();
  final TextEditingController _educCtrl = TextEditingController();
  final TextEditingController _experienceCtrl = TextEditingController();

  File? _image;
  FilePickupBloc? _filePickupBloc;
  IndexBloc? paymentTypeIndexingBloc;
  IndexBloc? paymentMethodIndexingBloc;
  late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _fNameCtrl.text = widget.accountModel.name;
    _phoneCtrl.text = widget.accountModel.phone;
    _emailCtrl.text = widget.accountModel.email;
    widget.accountModel.address == null
        ? _addressCtrl.text = ""
        : _addressCtrl.text = widget.accountModel.address!;
    widget.accountModel.company == null
        ? _companyCtrl.text = ""
        : _companyCtrl.text = widget.accountModel.company!;
    widget.accountModel.address == null
        ? _addressCtrl.text = ""
        : _addressCtrl.text = widget.accountModel.address!;
    widget.accountModel.skills == null
        ? _skillCtrl.text = ""
        : _skillCtrl.text = widget.accountModel.skills!;
    widget.accountModel.educations == null
        ? _educCtrl.text = ""
        : _educCtrl.text = widget.accountModel.educations!;
    widget.accountModel.experiences == null
        ? _experienceCtrl.text = ""
        : _experienceCtrl.text = widget.accountModel.experiences!;
    // widget.accountModel.image ==
    //     null ? _image=null : _image = widget.accountModel.image!;
    super.initState();
    _filePickupBloc = FilePickupBloc();
    paymentTypeIndexingBloc = IndexBloc();
    paymentMethodIndexingBloc = IndexBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addEditAppBar(context, "Edit Profile"),
      body: BlocListener<AccountBloc, AccountState>(
        listener: (context, state) {
          if (state is UpdatingAccount) {
            EasyLoading.show(status: 'loading');
          }
          if (state is ErrorUpdatingAccount) {
            errorSnackBar(text: state.error.toString(), context: context);
          }
          if (state is UpdatedAccount) {
            EasyLoading.dismiss();
            Navigator.pop(context);
            Navigator.pop(context);
            BlocProvider.of<AccountBloc>(context).add(FetchAccountStarted());
            EasyLoading.showSuccess('Success');
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
                    TextFormField(
                      controller: _fNameCtrl,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            borderSide: new BorderSide(
                              width: 1,
                            ),
                          ),
                          isDense: true,
                          labelText: "Name"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name is required.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _phoneCtrl,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            borderSide: new BorderSide(
                              width: 1,
                            ),
                          ),
                          isDense: true,
                          labelText: "Phone Number"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Phone Number is required.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _emailCtrl,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            borderSide: new BorderSide(
                              width: 1,
                            ),
                          ),
                          isDense: true,
                          labelText: "Email"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email is required.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _skillCtrl,
                      // keyboardType: TextInputType.text,
                      keyboardType: TextInputType.multiline,
                      minLines: 5,
                      maxLines: 20,
                      // expands: true,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            borderSide: new BorderSide(
                              width: 1,
                            ),
                          ),
                          isDense: true,
                          labelText: "Skills"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Skills is required.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _educCtrl,
                      keyboardType: TextInputType.multiline,
                      minLines: 5,
                      maxLines: 20,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            borderSide: new BorderSide(
                              width: 1,
                            ),
                          ),
                          isDense: true,
                          labelText: "Education"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Education is required.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _experienceCtrl,
                      keyboardType: TextInputType.multiline,
                      minLines: 5,
                      maxLines: 20,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            borderSide: new BorderSide(
                              width: 1,
                            ),
                          ),
                          isDense: true,
                          labelText: "Experiences"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Experiences is required.';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 15),
                    TextFormField(
                      controller: _companyCtrl,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            borderSide: new BorderSide(
                              width: 1,
                            ),
                          ),
                          isDense: true,
                          labelText: "Company"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Company is required.';
                        }
                        return null;
                      },
                    ),
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
                    //       return 'City is required.';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _addressCtrl,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            borderSide: new BorderSide(
                              width: 1,
                            ),
                          ),
                          isDense: true,
                          labelText: "Address"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Address is required.';
                        }
                        return null;
                      },
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
                                    'Upload  Image',
                                    // AppLocalizations.of(context)!
                                    //     .translate("uploadTransactionImage")!,
                                    style: TextStyle(
                                        fontFamily: 'BattambangRegular'),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Divider(),
                                  //  widget.accountModel.image==null?null:
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
                                                  child: widget.accountModel
                                                              .image !=
                                                          null
                                                      ? Image.network(widget
                                                          .accountModel.image!)
                                                      : (state == null)
                                                          ? Icon(
                                                              Icons
                                                                  .add_a_photo_outlined,
                                                              color: Colors
                                                                  .grey[300],
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
                    SizedBox(
                      height: 40,
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
                          color: Colors.redAccent,
                          onPressed: () {
                            if (_formKey!.currentState!.validate()) {}
                            if (_filePickupBloc!.state == null) {
                              BlocProvider.of<AccountBloc>(context).add(
                                  UpdateAccountStated(
                                      name: _fNameCtrl.text,
                                      phone: _phoneCtrl.text,
                                      email: _emailCtrl.text,
                                      address: _addressCtrl.text,
                                      skill: _skillCtrl.text,
                                      education: _educCtrl.text,
                                      experience: _experienceCtrl.text,
                                      city: _cityCtrl.text,
                                      company: _companyCtrl.text,
                                      imageUrl: _filePickupBloc!.state));
                              // customDialog(
                              //     context,
                              //     "",
                              //     Text(
                              //       "Please Upload Image",
                              //       // AppLocalizations.of(context)
                              //       //     .translate("pleaseChooseTransImage"),
                              //       style: TextStyle(fontFamily: 'BattambangRegular'),
                              //     ),
                              //     () {});
                            } else {
                              BlocProvider.of<AccountBloc>(context).add(
                                  UpdateAccountStated(
                                      name: _fNameCtrl.text,
                                      phone: _phoneCtrl.text,
                                      email: _emailCtrl.text,
                                      address: _addressCtrl.text,
                                      skill: _skillCtrl.text,
                                      education: _educCtrl.text,
                                      experience: _experienceCtrl.text,
                                      city: _cityCtrl.text,
                                      company: _companyCtrl.text,
                                      imageUrl: _filePickupBloc!.state));
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
                    // Container(
                    //   padding: EdgeInsets.only(top: 10),
                    //   child: Center(child: Text("រូបថត")),
                    // ),
                    // SizedBox(height: 15),
                    // GestureDetector(
                    //     onTap: () {
                    //       _showPicker(context);
                    //     },
                    //     child: Container(
                    //         width: (MediaQuery.of(context).size.width / 10) * 8,
                    //         child: (_image == null)
                    //             ? widget.accountModel.image == null
                    //                 ? Container(
                    //                     width:
                    //                         (MediaQuery.of(context).size.width /
                    //                                 10) *
                    //                             4,
                    //                     height:
                    //                         (MediaQuery.of(context).size.width /
                    //                                 10) *
                    //                             4,
                    //                     alignment: Alignment.center,
                    //                     padding: EdgeInsets.all(0),
                    //                     decoration: BoxDecoration(
                    //                         borderRadius:
                    //                             BorderRadius.circular(5)),
                    //                     child: FittedBox(
                    //                       fit: BoxFit.fill,
                    //                       child: Icon(
                    //                         Icons.add_a_photo_outlined,
                    //                         color: Colors.grey[600],
                    //                         size: (MediaQuery.of(context)
                    //                                     .size
                    //                                     .width /
                    //                                 10) *
                    //                             3,
                    //                       ),
                    //                     ),
                    //                   )
                    //                 : Container(
                    //                     // height: MediaQuery.of(context).size.width / 3,
                    //                     width:
                    //                         (MediaQuery.of(context).size.width /
                    //                                 10) *
                    //                             7,
                    //                     child: Image.network(
                    //                         "${widget.accountModel.image}"))
                    //             : Container(
                    //                 // height: MediaQuery.of(context).size.width / 3,
                    //                 width:
                    //                     (MediaQuery.of(context).size.width / 10) *
                    //                         7,
                    //                 child: Image.file(_image!)))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar:
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
