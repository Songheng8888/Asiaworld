import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:royal_landapp/src/feature/markettype/bloc/index.dart';
import 'package:royal_landapp/src/feature/markettype/model/markettyp_model.dart';
import 'package:royal_landapp/src/feature/myproperty/bloc/index.dart';
import 'package:royal_landapp/src/feature/myproperty/my_property_page.dart';
import 'package:royal_landapp/src/feature/project/bloc/index.dart';
import 'package:royal_landapp/src/feature/property/model/property_model.dart';
import 'package:royal_landapp/src/feature/propertytype/bloc/index.dart';
import 'package:royal_landapp/src/feature/propertytype/model/propertytype_model.dart';
import 'package:royal_landapp/src/shared/bloc/file_pickup/file_pickup_bloc.dart';
import 'package:royal_landapp/src/shared/bloc/index/index_bloc.dart';
import 'package:royal_landapp/src/shared/widget/appbar_add_edit.dart';
import 'package:royal_landapp/src/shared/widget/custome_modal.dart';
import 'package:royal_landapp/src/shared/widget/customer_dialog.dart';
import 'package:royal_landapp/src/shared/widget/error_snackbar.dart';
import 'package:royal_landapp/src/utils/share/helper.dart';

class EditProperty extends StatefulWidget {
  final PropertyModel propertyModel;
  const EditProperty({required this.propertyModel});

  @override
  _EditPropertyState createState() => _EditPropertyState();
}

class _EditPropertyState extends State<EditProperty> {
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
  TextEditingController locationCtrl = TextEditingController();
  final TextEditingController _marketCtrl = TextEditingController();
  late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  FilePickupBloc? _filePickupBloc;
  IndexBloc? paymentMethodIndexingBloc;
  IndexBloc? paymentTypeIndexingBloc;
  static String lat = "";
  static String long = "";
  String? addressDetail;
  String? propertyType;
  String? project;
  String? market;
  ProjectBloc _projectBloc = ProjectBloc();
  MarketTypeBloc _marketTypeBloc = MarketTypeBloc();
  PropertyTypeBloc _propertyTypeBloc = PropertyTypeBloc();
  // PropertyTypeModel propertyTypeModel;

  void initState() {
    _pronameCtrl.text = widget.propertyModel.propertyName!;
    propertyType = widget.propertyModel.typeModel!.name;
    project = widget.propertyModel.projectModel!.name;
    market = widget.propertyModel.marketTypeModel!.name;

    // _proPriceCtrl.text = widget.propertyModel.propertyPrice!;
    widget.propertyModel.propertyCode == null
        ? _proCodeCtrl.text = ""
        : _proCodeCtrl.text = widget.propertyModel.propertyCode!;
    widget.propertyModel.propertyPrice == null
        ? _proPriceCtrl.text = ""
        : _proPriceCtrl.text = widget.propertyModel.propertyPrice!;
    widget.propertyModel.propertyNo == null
        ? _proNoCtrl.text = ""
        : _proNoCtrl.text = widget.propertyModel.propertyNo!;
    widget.propertyModel.street == null
        ? _streetCtrl.text = ""
        : _streetCtrl.text = widget.propertyModel.street!;
    widget.propertyModel.address == null
        ? _addressCtrl.text = ""
        : _addressCtrl.text = widget.propertyModel.address!;

    widget.propertyModel.village == null
        ? _villageCtrl.text = ""
        : _villageCtrl.text = widget.propertyModel.village!;
    widget.propertyModel.commune == null
        ? _communeCtrl.text = ""
        : _communeCtrl.text = widget.propertyModel.commune!;
    widget.propertyModel.district == null
        ? _districtCtrl.text = ""
        : _districtCtrl.text = widget.propertyModel.district!;
    widget.propertyModel.province == null
        ? _provinceCtrl.text = ""
        : _provinceCtrl.text = widget.propertyModel.province!;
    locationCtrl.text = lat + long;
    lat = "";

    long = "";
    _protypeCtrl.text = propertyType!;
    _projectIdCtrl.text = project!;
    _marketCtrl.text = market!;
    // BlocProvider.of<ProjectBloc>(context).add(FetchProjectStarted());
    // BlocProvider.of<MarketTypeBloc>(context).add(FetchMarketTypeStarted());
    // BlocProvider.of<PropertyTypeBloc>(context).add(FetchPropertyTypeStarted());
    super.initState();
    _filePickupBloc = FilePickupBloc();
    paymentTypeIndexingBloc = IndexBloc();
    paymentMethodIndexingBloc = IndexBloc();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.propertyModel.img);
    return Scaffold(
      appBar: addEditAppBar(context, "Edit Product"),
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
                          context,
                          _propertyTypeBloc.propertytypelist
                              .map((e) => e.name!)
                              .toList(), (value) {
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
                    listener: (context, state) {
                    
                    },
                    child: BlocListener(
                      bloc: _marketTypeBloc,
                      listener: (context, state) {
                        if (state is FetchingMarketType) {
                          EasyLoading.show(status: 'loading...');
                        }
                        if (state is ErrorFetchingMarketType) {
                          EasyLoading.dismiss();
                          errorSnackBar(
                              text: state.error.toString(), context: context);
                        }
                        if (state is FetchedMarketType) {
                          EasyLoading.dismiss();
                          customModal(
                              context,
                              _marketTypeBloc.makert
                                  .map((e) => e.name)
                                  .toList(), (value) {
                            _marketCtrl.text = value;
                          
                          });
                        }
                      },
                      child: ListView(
                        children: [
                          Form(
                            key: _formKey,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
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
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _pronameCtrl,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        fillColor: Colors.grey.shade100,
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.grey.shade400)),
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
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  TextFormField(
                                    controller: _protypeCtrl,
                                    onTap: () {
                                      _propertyTypeBloc
                                          .add(FetchAllPropertyTypeStarted());
                                    },
                                    readOnly: true,
                                    // keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.arrow_drop_down),
                                        fillColor: Colors.grey.shade100,
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.grey.shade400)),
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
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  TextFormField(
                                    controller: _marketCtrl,
                                    onTap: () {
                                      _marketTypeBloc
                                          .add(FetchMarketTypeStarted());
                                    },
                                    readOnly: true,
                                    // keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.arrow_drop_down),
                                        fillColor: Colors.grey.shade100,
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.grey.shade400)),
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
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  TextFormField(
                                    controller: _proCodeCtrl,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        fillColor: Colors.grey.shade100,
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.grey.shade400)),
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
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  TextFormField(
                                    controller: _proPriceCtrl,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        fillColor: Colors.grey.shade100,
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.grey.shade400)),
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
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  TextFormField(
                                    controller: _provinceCtrl,
                                    keyboardType: TextInputType.text,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                        fillColor: Colors.grey.shade100,
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.grey.shade400)),
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

                                  SizedBox(height: 30),
                                  BlocBuilder(
                                    bloc: paymentTypeIndexingBloc,
                                    builder: (context, state) {
                                      if (state != 0) {
                                        return Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                // color: Theme.of(context).buttonColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Upload  Image',
                                                  // AppLocalizations.of(context)!
                                                  //     .translate("uploadTransactionImage")!,
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'BattambangRegular'),
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
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3,
                                                    child: AspectRatio(
                                                        aspectRatio: 1,
                                                        child: BlocBuilder(
                                                          bloc: _filePickupBloc,
                                                          builder: (context,
                                                              dynamic state) {
                                                            print(state);
                                                            return (state !=
                                                                    null)
                                                                ? Image.file(
                                                                    state)
                                                                : FittedBox(
                                                                    fit: BoxFit
                                                                        .fitHeight,
                                                                    child: widget.propertyModel.img !=
                                                                                null ||
                                                                            widget.propertyModel.img ==
                                                                                ""
                                                                        ? Image.network(widget
                                                                            .propertyModel
                                                                            .img!)
                                                                        : (state ==
                                                                                null)
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
                                  SizedBox(height: 15),
                               
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
              String myImage = "";
              File? _myImage;
              if (_formKey!.currentState!.validate()) {
                if (widget.propertyModel.img != null) {
                  if (_filePickupBloc!.state == null) {
                    myImage = widget.propertyModel.img!;
                  } else {
                    _myImage = _filePickupBloc!.state;
                  }
                  // validate when image from model
                } else {
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
                  }
                }
                String? locationlat;
                String? locationlong;
                String typeId = "";
                String typeMarket = "";
                if (addressDetail == null) {
                  print("location pick up is null");
                } else {
                  if (addressDetail!.contains("/")) {
                    locationlat = addressDetail!.split("/").first;
                    locationlong = addressDetail!.split("/").last;
                  }
                }

                // check
                if (_protypeCtrl.text != widget.propertyModel.typeModel!.name) {
                  PropertyTypeModel select = _propertyTypeBloc.propertytypelist
                      .firstWhere(
                          (element) => element.name == _protypeCtrl.text);
                  typeId = select.id!;
                } else {
                  typeId = widget.propertyModel.typeModel!.id!;
                }
                if (_marketCtrl.text !=
                    widget.propertyModel.marketTypeModel!.name) {
                  MarketTypeModel market = _marketTypeBloc.makert.firstWhere(
                      (element) => element.name == _marketCtrl.text);
                  typeMarket = market.id!;
                } else {
                  typeMarket = widget.propertyModel.marketTypeModel!.id!;
                }

                // addessdetail = 11.565271/94.6778 so we need to spilt into lat and long

                print("hi");

                // ProjectModel projectId = BlocProvider.of<ProjectBloc>(context)
                //     .project
                //     .firstWhere(
                //         (element) => element.name == _projectIdCtrl.text);

                // print(projectId.id);
                myPropertyBloc.add(UpdateMyPropertyStarted(
                    id: widget.propertyModel.id,
                    propertyName: _pronameCtrl.text,
                    // propertyType: "12",
                    propertyType: typeId,
                    projectId: "7",
                    makertId: typeMarket,
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
                    img: widget.propertyModel.img,
                    imgUrl: _myImage));
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
