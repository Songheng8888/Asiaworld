import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/constants/app_constant.dart';
import 'package:royal_landapp/src/feature/account/screen/widget/payment_method.dart';
import 'package:royal_landapp/src/feature/buynow/bloc/index.dart';
import 'package:royal_landapp/src/feature/buynow/screen/widget/payment_type.dart';
import 'package:royal_landapp/src/feature/property/model/property_model.dart';
import 'package:royal_landapp/src/shared/bloc/file_pickup/file_pickup_bloc.dart';
import 'package:royal_landapp/src/shared/bloc/indexing/indexing_bloc.dart';
import 'package:royal_landapp/src/shared/bloc/indexing/indexing_event.dart';
import 'package:royal_landapp/src/shared/widget/loadin_dialog.dart';
import 'package:royal_landapp/src/utils/share/appbar.dart';
import 'package:royal_landapp/src/utils/share/helper.dart';

BuyNowBloc _buyNowBloc = BuyNowBloc();

class BuyNowPage extends StatefulWidget {
  final PropertyModel listDeatail;
  BuyNowPage({required this.listDeatail});
  @override
  State<BuyNowPage> createState() => _BuyNowPageState();
}

class _BuyNowPageState extends State<BuyNowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => BuyNowBloc()..add(FetchBuyNow()),
        child: BuyNowPageBody(
          listDeatail: widget.listDeatail,
        ),
      ),
    );
  }
}

class BuyNowPageBody extends StatefulWidget {
  // final BuyNowItem buyNowItem;
  // BuyNowPageBody({required this.buyNowItem});
  final PropertyModel listDeatail;
  BuyNowPageBody({required this.listDeatail});

  @override
  _BuyNowPageBodyState createState() => _BuyNowPageBodyState();
}

class _BuyNowPageBodyState extends State<BuyNowPageBody> {
  late IndexingBloc paymentTypeIndexingBloc;
  late IndexingBloc paymentMethodIndexingBloc;
  FilePickupBloc? _filePickupBloc;

  @override
  void initState() {
    super.initState();
    paymentTypeIndexingBloc = IndexingBloc();
    paymentMethodIndexingBloc = IndexingBloc();
    _filePickupBloc = FilePickupBloc();
  }

  @override
  void dispose() {
    paymentTypeIndexingBloc.close();
    paymentMethodIndexingBloc.close();
    _filePickupBloc!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
          "Buy Now",
          style: TextStyle(fontFamily: 'kh', color: app_color),
          textScaleFactor: 1,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: BlocListener(
        bloc: _buyNowBloc,
        listener: (context, state) {
          print(state);
          if(state is BuyyingNow){
            loadingDialogs(context);
          }else if (state is ErrorBuynow){
            Navigator.pop(context);
          }else if (state is Bought){
            Navigator.pop(context);

          }
        },
        child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // SelectShippingAddressBtn(
                          //   buyNowItem: widget.buyNowItem,
                          // ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            width: size.width * 0.95,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: size.width * 0.3,
                                  height: size.width * 0.3,
                                  child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(widget.listDeatail.img!)),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: Container(
                                       height: size.width * 0.3,
                                      alignment: Alignment.topCenter,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${widget.listDeatail.propertyName!}",
                                            style: TextStyle(fontFamily: 'kh', fontWeight: FontWeight.w500),
                                            textScaleFactor: 1.1,
                                          )),
                                          SizedBox(height: 8,),
                                           Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "\$ ${widget.listDeatail.propertyPrice}",
                                            style: TextStyle(fontFamily: 'kh', color: app_color, fontWeight: FontWeight.bold),
                                            textScaleFactor: 1.1,
                                          ))
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          BlocProvider(
                              create: (BuildContext context) =>
                                  paymentTypeIndexingBloc,
                              child: PaymentType()),
                          SizedBox(
                            height: 15,
                          ),
                          BlocProvider(
                            create: (BuildContext context) =>
                                paymentMethodIndexingBloc,
                            child: BlocBuilder(
                              bloc: paymentTypeIndexingBloc,
                              builder: (c, dynamic state) {
                                if (state == 0) {
                                  return Container();
                                } else {
                                  paymentMethodIndexingBloc.add(Tapped(index: -1));
                                  return _paymentMethodWidget(context);
                                }
                              },
                            ),
                          ),
                          BlocBuilder(
                            bloc: paymentTypeIndexingBloc,
                            builder: (context, dynamic state) {
                              if (state != 0) {
                                return Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        // color: Theme.of(context).buttonColor,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(15))),
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Upload  Image"),
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
                          BlocBuilder<BuyNowBloc, BuyNowState>(
                            builder: (context, state) {
                              if (state is ErrorFetchingBuyNow) {
                                return Center(
                                  child: TextButton(
                                    onPressed: () {
                                      // BlocProvider.of<BuyNowBloc>(context).add(
                                      //     FetchBuyNow(
                                      //         buyNowItem: widget.buyNowItem,
                                      //         addressId: null));
                                    },
                                    child: Text("Retry"),
                                  ),
                                );
                              } else if (state is FetchedBuyNow) {
                                return Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            // color: Theme.of(context).buttonColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Item"),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Divider(),
                                            // CartProductTile(
                                            //   showDeleteBtn: false,
                                            //   editable: false,
                                            //   cartData: state.cart.data[0],
                                            // )
                                          ],
                                        )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    // CartSummary(cart: state.cart)
                                  ],
                                );
                              } else {
                                return Center();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  // BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                  //   if (state is FetchedCart) {
                  //     return _cartDetailFrame();
                  //   }
                  // })
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .color,
                                        fontWeight: FontWeight.w100)),
                                SizedBox(height: 10),
                                Text("\$" + "${widget.listDeatail.propertyPrice}",
                                    maxLines: 1,

                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                      fontFamily: 'kh',
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: RaisedButton(
                              elevation: 0,
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(color: Colors.blue, width: 1)),
                              padding: EdgeInsets.symmetric(vertical: 15),
                              onPressed: () {
                                _buyNowBloc.add(BuyNowPress(property_id: int.parse(widget.listDeatail.id)));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Submit",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(Icons.arrow_forward, color: Colors.white)
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
      ),
    );
  }


  _paymentMethodWidget(BuildContext contextt) {
    return Builder(
      builder: (c) {
        return BlocBuilder(
          bloc: BlocProvider.of<IndexingBloc>(c),
          builder: (context, dynamic state) {
            return GestureDetector(
              onTap: () {
                paymentMethodDialog(c);
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  margin: EdgeInsets.only(bottom: 15),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Choose Transfer Method"),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      (paymentMethodIndexingBloc.state == (-1))
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Choose here",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
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
                      title: new Text('Photo Library'),
                      onTap: () {
                        Helper.imgFromGallery((image) {
                          _filePickupBloc!.add(image);
                        });
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      Helper.imgFromCamera((image) {
                        _filePickupBloc!.add(image);
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
