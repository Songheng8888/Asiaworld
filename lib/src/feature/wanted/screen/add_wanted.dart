import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/markettype/bloc/index.dart';
import 'package:royal_landapp/src/feature/markettype/model/markettyp_model.dart';
import 'package:royal_landapp/src/feature/propertytype/bloc/index.dart';
import 'package:royal_landapp/src/feature/propertytype/model/propertytype_model.dart';
import 'package:royal_landapp/src/feature/wanted/bloc/index.dart';
import 'package:royal_landapp/src/shared/widget/custome_modal.dart';
import 'package:royal_landapp/src/shared/widget/error_snackbar.dart';
import 'package:royal_landapp/src/shared/widget/loadin_dialog.dart';
import 'package:royal_landapp/src/shared/widget/standard_appbar.dart';

class AddWanted extends StatefulWidget {
  const AddWanted({Key? key}) : super(key: key);

  @override
  _AddWantedState createState() => _AddWantedState();
}

class _AddWantedState extends State<AddWanted> {
  final TextEditingController _desCtrl = TextEditingController();
  final TextEditingController _protypeCtrl = TextEditingController();

  final TextEditingController _minCtrl = TextEditingController();
  final TextEditingController _maxCtrl = TextEditingController();
  final TextEditingController _contactCtrl = TextEditingController();

  final TextEditingController _marketCtrl = TextEditingController();
  TextEditingController locationCtrl = TextEditingController();
  late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: standardAppBar(context, "Add Wanted"),
      body: Builder(
        builder: (context) {
          return BlocListener<WantedBloc, WantedState>(
              listener: (context, state) {
                if (state is AddingWanted) {
                  // Navigator.pop(context);

                  loadingDialogs(context);
                }
                if (state is ErrorAddingWanted) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  errorSnackBar(text: state.error.toString(), context: context);
                }
                if (state is AddedWanted) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  BlocProvider.of<WantedBloc>(context)
                      .add(FetchWantedStarted());
                  print("suuces");
                }
              },
              child: BlocListener<PropertyTypeBloc, PropertyTypeState>(
                  listener: (context, state) {
                    if (state is FetchingPropertyType) {
                      loadingDialogs(context);
                    } else if (state is FetchedPropertyType) {
                      Navigator.pop(context);
                      customModal(
                          context,
                          BlocProvider.of<PropertyTypeBloc>(context)
                              .propertytypelist
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
                  child: BlocListener<MarketTypeBloc, MarketTypeState>(
                    listener: (context, state) {
                      if (state is FetchingMarketType) {
                        Center(
                          child: CircularProgressIndicator(),
                        );
                        // loadingDialogs(context);
                      }
                      if (state is ErrorFetchingMarketType) {
                        Navigator.pop(context);
                        errorSnackBar(
                            text: state.error.toString(), context: context);
                      }
                      if (state is FetchedMarketType) {
                        // Navigator.pop(context);
                        customModal(
                            context,
                            BlocProvider.of<MarketTypeBloc>(context)
                                .makert
                                .map((e) => e.name)
                                .toList(), (value) {
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
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _desCtrl,
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
                                      labelText: "Description"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Description   is required.';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  controller: _protypeCtrl,
                                  onTap: () {
                                    BlocProvider.of<PropertyTypeBloc>(context)
                                        .add(FetchPropertyTypeStarted());
                                  },
                                  readOnly: true,
                                  // keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.arrow_drop_down),
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
                                      labelText: "Property Type"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Property Type is required.';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  controller: _marketCtrl,
                                  onTap: () {
                                    BlocProvider.of<MarketTypeBloc>(context)
                                      ..add(FetchMarketTypeStarted());
                                    // BlocProvider.of<MyPropertyBloc>(context)
                                    //     .add(FetchProjectStarted());
                                  },
                                  readOnly: true,
                                  // keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.arrow_drop_down),
                                      contentPadding: EdgeInsets.all(15),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5.0),
                                        ),
                                        borderSide: new BorderSide(
                                          width: 1,
                                        ),
                                      ),
                                      labelText: "Market Type"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Market Type is required.';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  controller: _minCtrl,
                                  keyboardType: TextInputType.text,
                                  // keyboardType: TextInputType.text,
                                  // keyboardType: TextInputType.multiline,
                                  // minLines: 5,
                                  // maxLines: 20,
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
                                      labelText: "Min Price"),
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return 'Skills is required.';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  controller: _maxCtrl,
                                  keyboardType: TextInputType.text,
                                  // keyboardType: TextInputType.multiline,
                                  // minLines: 5,
                                  // maxLines: 20,
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
                                      labelText: "Max Price"),
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return 'Property Price is required.';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  controller: _contactCtrl,
                                  keyboardType: TextInputType.text,
                                  // keyboardType: TextInputType.multiline,
                                  // minLines: 5,
                                  // maxLines: 20,
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
                                      labelText: "Contact number"),
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return 'Property No is required.';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
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
              if (_formKey!.currentState!.validate()) {
                PropertyTypeModel select = BlocProvider.of<PropertyTypeBloc>(
                        context)
                    .propertytypelist
                    .firstWhere((element) => element.name == _protypeCtrl.text);

                MarketTypeModel marketid =
                    BlocProvider.of<MarketTypeBloc>(context).makert.firstWhere(
                        (element) => element.name == _marketCtrl.text);

                BlocProvider.of<WantedBloc>(context).add(AddWantedStarted(
                    description: _desCtrl.text,
                    propertyTypeId: select.id!,
                    minPrice: _minCtrl.text,
                    maxPrice: _maxCtrl.text,
                    marketTypeId: marketid.id!,
                    contactNumber: _contactCtrl.text));
                print("type id ${select.id}");
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
}
