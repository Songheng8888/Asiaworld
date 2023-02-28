import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:royal_landapp/src/feature/myproperty/bloc/index.dart';
import 'package:royal_landapp/src/feature/myproperty/screen/edit_property_page.dart';
import 'package:royal_landapp/src/feature/myproperty/screen/myproperty_detail_page.dart';
import 'package:royal_landapp/src/feature/property/model/property_model.dart';
import 'package:royal_landapp/src/feature/property/screen/property_page_detail.dart';

import 'package:royal_landapp/src/shared/widget/error_snackbar.dart';
import 'package:royal_landapp/src/shared/widget/loadin_dialog.dart';
import 'package:transparent_image/transparent_image.dart';

class Item extends StatefulWidget {
  final bool isVerticalParent;
  final PropertyModel propertyModel;
  const Item({this.isVerticalParent = true, required this.propertyModel});

  @override
  _PropertyItemState createState() => _PropertyItemState();
}

class _PropertyItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (con) => PropertyDetail(
                        listDeatail: widget.propertyModel,
                      )));
        },
        child: BlocListener<MyPropertyBloc, MyPropertyState>(
          listener: (context, state) {
            if (state is AddingMyProperty) {
              // Navigator.pop(context);
              loadingDialogs(context);
            }
            if (state is ErrorAddingMyProperty) {
              Navigator.pop(context);
              errorSnackBar(text: state.error.toString(), context: context);
            }
            if (state is AddedMyProperty) {
              Navigator.pop(context);
              // Navigator.pop(context);
              // Navigator.pop(context);
              // BlocProvider.of<MyPropertyBloc>(context)
              //     .add(FetchMyPropertyStarted());
              print("succes");
            }
          },
          child: Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Container(
                            width: double.infinity,
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              imageCacheHeight:
                                  (widget.isVerticalParent) ? 260 : 250,
                              imageCacheWidth:
                                  (widget.isVerticalParent) ? 350 : 250,
                              image: widget.propertyModel.img!,
                              fit: BoxFit.fitWidth,
                              imageErrorBuilder: (b, c, d) {
                                return Image.asset(
                                    "assets/images/asiaworld-01.png");
                              },
                            )),
                      ),
                      // widget.propertyModel.promoPercent != null
                      //     ?

                      // Container(
                      //     //alignme...................00000000000nt: Alignment.topRight,
                      //     padding: EdgeInsets.all(3),
                      //     color: Colors.red,
                      //     child:
                      //         // IconButton(
                      //         //         icon: Icon(
                      //         //           CupertinoIcons.heart,
                      //         //           size: 27,
                      //         //         ),
                      //         //         onPressed: () {})
                      //         Text("\$${widget.propertyModel.propertyPrice}",
                      //             textScaleFactor: 1.4,
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.bold,
                      //             )))
                      // : Center(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  flex: 25,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    //color: Colors.grey,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.propertyModel.propertyName}",
                              maxLines: 2,
                              style: TextStyle(
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: 1.2,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Type : "),
                                Text(
                                  "${widget.propertyModel.marketTypeModel!.name}",
                                  maxLines: 2,
                                  style: TextStyle(
                                      letterSpacing: 0,
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .color,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  textScaleFactor: 1,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Icon(
                                //   Icons.location_on,
                                //   color: Colors.green,
                                // ),
                                Text(
                                  "${widget.propertyModel.province}",
                                  maxLines: 2,
                                  style: TextStyle(
                                      letterSpacing: 0,
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .color,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  textScaleFactor: 1,
                                ),
                              ],
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Text("Size : "),
                            //     Text(
                            //       "${widget.propertyModel.size}",
                            //       maxLines: 2,
                            //       style: TextStyle(
                            //           letterSpacing: 0,
                            //           color: Theme.of(context)
                            //               .textTheme
                            //               .headline1!
                            //               .color,
                            //           fontWeight: FontWeight.w400),
                            //       textAlign: TextAlign.left,
                            //       overflow: TextOverflow.ellipsis,
                            //       textScaleFactor: 1,
                            //     ),
                            //   ],
                            // )
                          ],
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                    //color: Colors.pink,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 80,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CupertinoButton(
                                  padding: EdgeInsets.all(1.0),
                                  color: Colors.green,
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (con) => EditProperty(
                                                  propertyModel:
                                                      widget.propertyModel,
                                                )));
                                  }),
                              SizedBox(
                                width: 5,
                              ),
                              CupertinoButton(
                                  padding: EdgeInsets.all(1.0),
                                  color: Colors.red,
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete),
                                    ],
                                  ),
                                  onPressed: () {
                                    BlocProvider.of<MyPropertyBloc>(context)
                                        .add(DeleteMyPropertyStarted(
                                            id: widget.propertyModel.id));
                                  }),
                              // Container(
                              //   alignment: Alignment.bottomLeft,
                              //   child: Text(
                              //     "" + "100000",
                              //     maxLines: 1,
                              //     textScaleFactor: 1.1,
                              //     overflow: TextOverflow.fade,
                              //     style: TextStyle(
                              //         fontWeight: FontWeight.bold,
                              //         letterSpacing: 0,
                              //         color: Colors.red[300]),
                              //   ),
                              // ),
                              // SizedBox(width: 5),
                              // widget.product.promoPrice != null
                              //     ? Expanded(
                              //         child: SizedBox(
                              //           child: Text(
                              //             "" +
                              //                 ((widget.product.promoPrice != null)
                              //                     ? widget.product.price
                              //                     : " "),
                              //             maxLines: 1,
                              //             overflow: TextOverflow.ellipsis,
                              //             textScaleFactor: 0.8,
                              //             style: TextStyle(
                              //                 color: Colors.grey,
                              //                 decoration:
                              //                     TextDecoration.lineThrough),
                              //           ),
                              //         ),
                              //       )
                              //     : Center()
                            ],
                          ),
                        ),
                        // Expanded(
                        //     flex: 20,
                        //     child: Container(
                        //         alignment: Alignment.topRight,
                        //         child: FittedBox(
                        //           child: Container(
                        //               //alignme...................00000000000nt: Alignment.topRight,
                        //               padding: EdgeInsets.all(3),
                        //               // color: Colors.red,
                        //               child: IconButton(
                        //                   icon: Icon(
                        //                     CupertinoIcons.heart,
                        //                     size: 27,
                        //                   ),
                        //                   onPressed: () {})),
                        //         )))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
