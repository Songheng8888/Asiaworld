import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal_landapp/src/constants/app_constant.dart';
import 'package:royal_landapp/src/feature/property/model/property_model.dart';

import 'package:royal_landapp/src/feature/property/screen/property_page_detail.dart';

import 'package:transparent_image/transparent_image.dart';

class PropertyItem extends StatefulWidget {
  final bool isVerticalParent;
  final PropertyModel propertyModel;
  const PropertyItem({this.isVerticalParent = true, required this.propertyModel});

  @override
  _PropertyItemState createState() => _PropertyItemState();
}

class _PropertyItemState extends State<PropertyItem> {
  @override
  Widget build(BuildContext context) {
    if (widget.isVerticalParent == true) {
      return _buildVertical();
    }
    return _buildHorizontal();
  }

  _buildVertical() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (con) => PropertyDetail(
                      listDeatail: widget.propertyModel,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                offset: Offset(1, 1),
                blurRadius: 1,
              )
            ]),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  AspectRatio(
                    aspectRatio: 4 / 3.5,
                    child: Container(
                      color: Colors.white,
                      child: ExtendedImage.network(
                        widget.propertyModel.img!,
                        cacheWidth: 1000,
                        enableMemoryCache: true,
                        clearMemoryCacheWhenDispose: true,
                        clearMemoryCacheIfFailed: false,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
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
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.propertyModel.propertyName == null
                            ? Text("")
                            : Text(
                                "${widget.propertyModel.propertyName}",
                                maxLines: 2,
                                style: TextStyle(
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'kh'),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                textScaleFactor: 1.2,
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Type : "),
                            widget.propertyModel.marketTypeModel == null
                                ? Text("")
                                : Text(
                                    "${widget.propertyModel.marketTypeModel!.name}",
                                    maxLines: 2,
                                    style: TextStyle(
                                        letterSpacing: 0,
                                        color: Theme.of(context).textTheme.headline1!.color,
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
                            widget.propertyModel.province == null
                                ? Text("")
                                : Text(
                                    "${widget.propertyModel.province}",
                                    maxLines: 2,
                                    style: TextStyle(
                                        letterSpacing: 0,
                                        color: Theme.of(context).textTheme.headline1!.color,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    textScaleFactor: 1,
                                  ),
                          ],
                        ),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          widget.propertyModel.propertyPrice == null
                              ? Container()
                              : Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "\$${widget.propertyModel.propertyPrice}",
                                    maxLines: 1,
                                    textScaleFactor: 1.1,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0,
                                        color: Colors.red[300]),
                                  ),
                                ),
                          SizedBox(width: 5),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                            alignment: Alignment.topRight,
                            child: FittedBox(
                              child: Container(
                                  padding: EdgeInsets.all(3),
                                  child: IconButton(
                                      icon: Icon(
                                        CupertinoIcons.heart,
                                        color: Colors.grey,
                                        size: 27,
                                      ),
                                      onPressed: () {})),
                            )))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildHorizontal() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (con) => PropertyDetail(
                      listDeatail: widget.propertyModel,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                offset: Offset(1, 1),
                blurRadius: 1,
              )
            ]),
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  AspectRatio(
                    aspectRatio: 4 / 3.5,
                    child: Container(
                        // margin: EdgeInsets.only(left: 20, right: 20),
                        // padding: EdgeInsets.only(left: 20, right: 20),
                        width: double.infinity,
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          imageCacheHeight: (widget.isVerticalParent) ? 260 : 250,
                          imageCacheWidth: (widget.isVerticalParent) ? 350 : 250,
                          image: widget.propertyModel.img!,
                          fit: BoxFit.cover,
                          imageErrorBuilder: (b, c, d) {
                            return Image.asset("assets/images/asiaworld-01.png");
                          },
                        )),
                  ),
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
                        widget.propertyModel.propertyName == null
                            ? Text("")
                            : Text(
                                "${widget.propertyModel.propertyName}",
                                maxLines: 2,
                                style: TextStyle(
                                    fontFamily: 'kh',
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                textScaleFactor: 1.2,
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.propertyModel.marketTypeModel == null
                                ? Text("")
                                : Text(
                                    "${widget.propertyModel.marketTypeModel!.name}",
                                    maxLines: 2,
                                    style: TextStyle(
                                        letterSpacing: 0,
                                        color: Theme.of(context).textTheme.headline1!.color,
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
                            widget.propertyModel.province == null
                                ? Text("")
                                : Text(
                                    "${widget.propertyModel.province}",
                                    maxLines: 2,
                                    style: TextStyle(
                                        letterSpacing: 0,
                                        color: Theme.of(context).textTheme.headline1!.color,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    textScaleFactor: 1,
                                  ),
                          ],
                        ),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          widget.propertyModel.propertyPrice == null
                              ? Container()
                              : Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "\$${widget.propertyModel.propertyPrice}",
                                    maxLines: 1,
                                    textScaleFactor: 1.1,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0,
                                        color: app_color),
                                  ),
                                ),
                          SizedBox(width: 5),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Container(
                            alignment: Alignment.topRight,
                            child: FittedBox(
                              child: Container(
                                  //alignme...................00000000000nt: Alignment.topRight,
                                  padding: EdgeInsets.all(3),
                                  // color: Colors.red,
                                  child: IconButton(
                                      icon: Icon(
                                        CupertinoIcons.heart,
                                        color: Colors.grey,
                                        size: 27,
                                      ),
                                      onPressed: () {})),
                            )))
                  ],
                ),
              ),
            ),
            // Expanded(child: Container()),
            // Flexible(child: SizedBox(height: 8,))
          ],
        ),
      ),
    );
  }
}
