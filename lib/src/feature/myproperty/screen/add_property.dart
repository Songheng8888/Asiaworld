import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:royal_landapp/src/feature/markettype/bloc/index.dart';
import 'package:royal_landapp/src/feature/markettype/model/markettyp_model.dart';
import 'package:royal_landapp/src/feature/myproperty/bloc/index.dart';
import 'package:royal_landapp/src/feature/myproperty/my_property_page.dart';
import 'package:royal_landapp/src/feature/project/bloc/index.dart';
import 'package:royal_landapp/src/feature/project/bloc/project_bloc.dart';
import 'package:royal_landapp/src/feature/propertytype/bloc/index.dart';
import 'package:royal_landapp/src/feature/propertytype/model/propertytype_model.dart';
import 'package:royal_landapp/src/shared/bloc/file_pickup/file_pickup_bloc.dart';
import 'package:royal_landapp/src/shared/bloc/index/index_bloc.dart';
import 'package:royal_landapp/src/shared/widget/appbar_add_edit.dart';
import 'package:royal_landapp/src/shared/widget/custome_modal.dart';
import 'package:royal_landapp/src/shared/widget/customer_dialog.dart';
import 'package:royal_landapp/src/shared/widget/error_snackbar.dart';
import 'package:royal_landapp/src/utils/share/helper.dart';

class AddPropertyPage extends StatefulWidget {
  const AddPropertyPage({Key? key}) : super(key: key);

  @override
  AddPropertyPageState createState() => AddPropertyPageState();
}

class AddPropertyPageState extends State<AddPropertyPage> {
  final TextEditingController _pronameCtrl = TextEditingController();
  final TextEditingController _protypeCtrl = TextEditingController();
  final TextEditingController _projectIdCtrl = TextEditingController();
  final TextEditingController _proCodeCtrl = TextEditingController();
  final TextEditingController _proPriceCtrl = TextEditingController();
  final TextEditingController _proNoCtrl = TextEditingController();
  final TextEditingController _addressCtrl = TextEditingController();
  final TextEditingController _streetCtrl = TextEditingController();
  final TextEditingController _villageCtrl = TextEditingController();
  final TextEditingController _communeCtrl = TextEditingController();
  final TextEditingController _districtCtrl = TextEditingController();
  final TextEditingController _provinceCtrl = TextEditingController();
  final TextEditingController _marketCtrl = TextEditingController();
  TextEditingController locationCtrl = TextEditingController();
  late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  FilePickupBloc? _filePickupBloc;
  IndexBloc? paymentMethodIndexingBloc;
  IndexBloc? paymentTypeIndexingBloc;
  static String lat = "";
  static String long = "";
  String? addressDetail;
  ProjectBloc _projectBloc = ProjectBloc();
  MarketTypeBloc _marketTypeBloc = MarketTypeBloc();
  PropertyTypeBloc _propertyTypeBloc = PropertyTypeBloc();

  void initState() {
    // _fNameCtrl.text = widget.accountModel.name;
    // _phoneCtrl.text = widget.accountModel.phone;
    // _emailCtrl.text = widget.accountModel.email;
    // widget.accountModel.address == null
    //     ? _addressCtrl.text = ""
    //     : _addressCtrl.text = widget.accountModel.address!;
    // widget.accountModel.company == null
    //     ? _companyCtrl.text = ""
    //     : _companyCtrl.text = widget.accountModel.company!;
    // widget.accountModel.address == null
    //     ? _addressCtrl.text = ""
    //     : _addressCtrl.text = widget.accountModel.address!;
    // widget.accountModel.skills == null
    //     ? _skillCtrl.text = ""
    //     : _skillCtrl.text = widget.accountModel.skills!;
    // widget.accountModel.educations == null
    //     ? _educCtrl.text = ""
    //     : _educCtrl.text = widget.accountModel.educations!;
    // widget.accountModel.experiences == null
    //     ? _experienceCtrl.text = ""
    //     : _experienceCtrl.text = widget.accountModel.experiences!;
    // widget.accountModel.image ==
    //     null ? _image=null : _image = widget.accountModel.image!;
    locationCtrl.text = lat + long;
    lat = "";
    long = "";
    super.initState();
    _filePickupBloc = FilePickupBloc();
    paymentTypeIndexingBloc = IndexBloc();
    paymentMethodIndexingBloc = IndexBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addEditAppBar(context, "Add Product"),
      body: Builder(
        builder: (context) {
          return BlocListener(
              bloc: myPropertyBloc,
              listener: (context, state) {
                if (state is AddingMyProperty) {
                  EasyLoading.show(status: 'loading...');
                }
                if (state is ErrorAddingMyProperty) {
                  EasyLoading.dismiss();
                  errorSnackBar(text: state.error.toString(), context: context);
                }
                if (state is AddedMyProperty) {
                  EasyLoading.dismiss();
                  EasyLoading.showSuccess("Sucess");
                  Navigator.pop(context);
                }
              },
              child: BlocListener(
                  bloc: _propertyTypeBloc,
                  listener: (context, state) {
                    if (state is FetchingAllPropertyType) {
                      EasyLoading.show(status: 'loading...');
                    } else if (state is FetchedAllPropertyType) {
                      EasyLoading.dismiss();
                      customModal(
                          context, _propertyTypeBloc.propertytypelist.map((e) => e.name!).toList(),
                          (value) {
                        _protypeCtrl.text = value;
                        // roomTypeModel = BlocProvider.of<RoomTypeBloc>(context)
                        //     .roomtype
                        //     .firstWhere((roomtype) => roomtype.type == value);
                        // _roomNumberCtrl.clear();
                        // _stayingCtrl.clear();
                      });
                    }
                  },
                  child: BlocListener(
                    bloc: _projectBloc,
                    listener: (context, state) {},
                    child: BlocListener(
                      bloc: _marketTypeBloc,
                      listener: (context, state) {
                        if (state is FetchingMarketType) {
                          EasyLoading.show(status: 'loading...');
                        }
                        if (state is ErrorFetchingMarketType) {
                          EasyLoading.dismiss();
                          errorSnackBar(text: state.error.toString(), context: context);
                        }
                        if (state is FetchedMarketType) {
                          EasyLoading.dismiss();
                          customModal(context, _marketTypeBloc.makert.map((e) => e.name).toList(),
                              (value) {
                            _marketCtrl.text = value;
                            // roomTypeModel = BlocProvider.of<RoomTypeBloc>(context)
                            //     .roomtype
                            //     .firstWhere((roomtype) => roomtype.type == value);
                            // _roomNumberCtrl.clear();
                            // _stayingCtrl.clear();
                          });
                        }
                      },
                      child: ListView(
                        children: [
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
                                      "Product name",
                                      textScaleFactor: 1.1,
                                      style: TextStyle(
                                          color: Colors.grey, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _pronameCtrl,
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
                                        labelText: "ex. Honda"),
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
                                    child: Text("Choose Category",
                                        textScaleFactor: 1.1,
                                        style: TextStyle(
                                            color: Colors.grey, fontWeight: FontWeight.bold)),
                                  ),
                                  TextFormField(
                                    controller: _protypeCtrl,
                                    onTap: () {
                                      _propertyTypeBloc.add(FetchAllPropertyTypeStarted());
                                    },
                                    readOnly: true,
                                    // keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.arrow_drop_down),
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
                                        labelText: "ex. Motor"),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'category  is required.';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 15),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 8),
                                    child: Text("Maket type",
                                        textScaleFactor: 1.1,
                                        style: TextStyle(
                                            color: Colors.grey, fontWeight: FontWeight.bold)),
                                  ),
                                  TextFormField(
                                    controller: _marketCtrl,
                                    onTap: () {
                                      _marketTypeBloc.add(FetchMarketTypeStarted());
                                    },
                                    readOnly: true,
                                    // keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.arrow_drop_down),
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
                                        labelText: "ex. Motor"),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'category  is required.';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 15),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 8),
                                    child: Text("Product Code",
                                        textScaleFactor: 1.1,
                                        style: TextStyle(
                                            color: Colors.grey, fontWeight: FontWeight.bold)),
                                  ),
                                  TextFormField(
                                    controller: _proCodeCtrl,
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
                                        labelText: "ex. P001"),
                                  ),
                                  SizedBox(height: 15),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 8),
                                    child: Text("Product Price",
                                        textScaleFactor: 1.1,
                                        style: TextStyle(
                                            color: Colors.grey, fontWeight: FontWeight.bold)),
                                  ),
                                  TextFormField(
                                    controller: _proPriceCtrl,
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
                                        labelText: "ex. 1200\$"),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Product Price is required.';
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
                                    controller: _provinceCtrl,
                                    keyboardType: TextInputType.text,
                                    maxLines: null,
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
                                        labelText: "ex. Phnom Penh"),
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
                                            padding:
                                                EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Upload  Image',
                                                  // AppLocalizations.of(context)!
                                                  //     .translate("uploadTransactionImage")!,
                                                  textScaleFactor: 1.1,
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.bold),
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
                                                    height: MediaQuery.of(context).size.width / 3,
                                                    child: AspectRatio(
                                                        aspectRatio: 1,
                                                        child: BlocBuilder(
                                                          bloc: _filePickupBloc,
                                                          builder: (context, dynamic state) {
                                                            return FittedBox(
                                                                fit: BoxFit.fitHeight,
                                                                child: (state == null)
                                                                    ? Icon(
                                                                        Icons.add_a_photo_outlined,
                                                                        color: Colors.grey[300],
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
                                  SizedBox(height: 30),
                                  Container(
                                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                                    height: 50,
                                    width: double.infinity,
                                    child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
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
                                                    style:
                                                        TextStyle(fontFamily: 'BattambangRegular'),
                                                  ),
                                                  () {});
                                            } else {
                                              String? locationlat;
                                              String? locationlong;
                                              if (addressDetail == null) {
                                                print("location pick up is null");
                                              } else {
                                                if (addressDetail!.contains("/")) {
                                                  locationlat = addressDetail!.split("/").first;
                                                  locationlong = addressDetail!.split("/").last;
                                                }
                                              }

                                              PropertyTypeModel select = _propertyTypeBloc
                                                  .propertytypelist
                                                  .firstWhere((element) =>
                                                      element.name == _protypeCtrl.text);

                                              MarketTypeModel marketid = _marketTypeBloc.makert
                                                  .firstWhere((element) =>
                                                      element.name == _marketCtrl.text);
                                              // print(projectId.id);
                                              myPropertyBloc.add(AddMyPropertyStarted(
                                                  propertyName: _pronameCtrl.text,
                                                  // propertyType: "12",
                                                  propertyType: select.id!,
                                                  projectId: "7",
                                                  marketId: marketid.id!,
                                                  propertyCode: _proCodeCtrl.text,
                                                  propertyPrice: _proPriceCtrl.text,
                                                  propertyNo: _proNoCtrl.text,
                                                  address: _addressCtrl.text,
                                                  street: _streetCtrl.text,
                                                  lat: addressDetail == null ? "" : locationlat!,
                                                  long: addressDetail == null ? "" : locationlong!,
                                                  village: _villageCtrl.text,
                                                  commune: _communeCtrl.text,
                                                  district: _districtCtrl.text,
                                                  province: _provinceCtrl.text,
                                                  imgUrl: _filePickupBloc!.state));
                                              // print("type id ${select.id}");
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
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )));
        },
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
