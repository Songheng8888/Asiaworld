import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class BlogItem extends StatefulWidget {
  final bool isVerticalParent;
  const BlogItem({this.isVerticalParent = true});

  @override
  _BlogItemState createState() => _BlogItemState();
}

class _BlogItemState extends State<BlogItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Container(
                      // margin: EdgeInsets.only(left: 20, right: 20),
                      // padding: EdgeInsets.only(left: 20, right: 20),
                      width: double.infinity,
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        imageCacheHeight: (widget.isVerticalParent) ? 260 : 250,
                        imageCacheWidth: (widget.isVerticalParent) ? 350 : 250,
                        image:
                            "https://www.realestate.com.kh/static/img/investment_guide/cover-investment-guide-2020.jpg",
                        fit: BoxFit.fitWidth,
                        imageErrorBuilder: (b, c, d) {
                          return Image.asset(
                              "assets/images/asiaworld-01.png");
                        },
                      )),
                ),
                // widget.propertyModel.promoPercent != null
                //     ?

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
                        "Welcome to Borey Peng Huoth, a leading construction and housing development company in Cambodia",
                        maxLines: 2,
                        style: TextStyle(
                            letterSpacing: 0, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        textScaleFactor: 1.2,
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
