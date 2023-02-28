import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:royal_landapp/src/constants/app_constant.dart';
import 'package:royal_landapp/src/feature/list/buttom_detail.dart';
import 'package:royal_landapp/src/feature/property/model/property_model.dart';
import 'package:royal_landapp/src/feature/property/screen/widget/property_map.dart';
import 'package:royal_landapp/src/feature/property/screen/widget/related_properties.dart';

class PropertyDetail extends StatefulWidget {
  final PropertyModel listDeatail;
  const PropertyDetail({required this.listDeatail});

  @override
  _PropertyDetailPageState createState() => _PropertyDetailPageState();
}

class _PropertyDetailPageState extends State<PropertyDetail> {
  // ButtomDetailPage _buttomDetailPage = ButtomDetailPage(listDeatail: widget.listDeatail,);
  final List<String> imagesListUrl = [
    'assets/category/house2.jpeg',
    'assets/category/house2.jpeg',
    'assets/category/house2.jpeg',
    'assets/category/house2.jpeg',
    'assets/category/house2.jpeg',
    'assets/category/house2.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ButtomDetailPage(
        listDeatail: widget.listDeatail,
      ),
      body: CustomScrollView(
        slivers: [
          _buildHeader(context),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              // alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(width: 20,),
                      Container(
                        alignment: Alignment.centerLeft,
                        // color: Colors.amber,
                        child: Text(
                          widget.listDeatail.propertyName!,
                          textScaleFactor: 1.5,
                          style: TextStyle(
                              fontFamily: 'kh', fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Text(
                          "\$ ",
                          textScaleFactor: 1.8,
                          style: TextStyle(
                              color: app_color, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.listDeatail.propertyPrice!,
                          textScaleFactor: 1.8,
                          style: TextStyle(
                              color: app_color,
                              fontFamily: 'btb',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15, right: 20),
                    child: Row(
                      children: [
                        Text(
                          "Property Description",
                          textScaleFactor: 1.4,
                        )
                      ],
                    ),
                  ),
                  widget.listDeatail.size == null
                      ? Container()
                      : _buildContainer(
                          title: "Size", dynamicTitle: widget.listDeatail.size),
                  _buildContainer(title: "Width", dynamicTitle: "100"),
                  _buildContainer(title: "Lenght", dynamicTitle: "200"),
                  _buildContainer(
                      title: "Type",
                      dynamicTitle: widget.listDeatail.typeModel!.name),
                  widget.listDeatail.province == null
                      ? Container()
                      : _buildContainer(
                          title: "Province",
                          dynamicTitle: widget.listDeatail.province),
                  _buildContainer(title: "Date", dynamicTitle: "10/02/2022"),
                  Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Divider()),
                  Container(
                    padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                    child: Row(
                      children: [
                        Text(
                          "Location on google map",
                          textScaleFactor: 1.4,
                        )
                      ],
                    ),
                  ),
                  widget.listDeatail.lat == null &&
                          widget.listDeatail.long == null
                      ? Container()
                      : Container(
                          padding:
                              EdgeInsets.only(top: 15, left: 20, right: 20),
                          height: 300,
                          width: 500,
                          // decoration: BoxDecoration(color: Colors.white),
                          child: PropertyMap(
                            lat: widget.listDeatail.lat,
                            lon: widget.listDeatail.long,
                          ),
                        ),
                  Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Divider()),
                  Container(
                    padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                    child: Row(
                      children: [
                        Text(
                          "Other related product",
                          textScaleFactor: 1.4,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: RelatedProperty(
                      id: widget.listDeatail.id,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildHeader(BuildContext context) {
    return SliverAppBar(
      brightness: Theme.of(context).brightness,
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(0.3),
      expandedHeight: 250,
      floating: true,
      pinned: true,
      // title: Text("Royal Land"),
      leading: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: RawMaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            elevation: 0.0,
            // fillColor: Colors.redAccent[100],
            child: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black87,
              size: 30,
            ),
            shape: CircleBorder(),
          ),
        ),
      ),
      actions: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // color: Colors.redAccent[100],
              ),
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Icon(
                Icons.favorite_outline_outlined,
                color: Colors.black87,
                size: 30,
              )),
        ),
        AspectRatio(
          aspectRatio: 1,
          child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // color: Colors.redAccent[100],
              ),
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Icon(
                Icons.share_outlined,
                color: Colors.black87,
                size: 30,
              )),
        ),
        SizedBox(
          width: 5,
        ),
      ],

      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: CarouselSlider(
              items: widget.listDeatail.photoModel!
                  .map(
                    (e) => Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        width: 500,
                        height: 250,
                        // height: 230,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          color: Colors.white,
                          child: ExtendedImage.network(
                            e.image,
                            cacheWidth: 1000,
                            enableMemoryCache: true,
                            clearMemoryCacheWhenDispose: true,
                            clearMemoryCacheIfFailed: false,
                            fit: BoxFit.contain,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                onPageChanged: (index, s) {},
                // aspectRatio: 1.68,
                aspectRatio: 1.47,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
        
                autoPlayAnimationDuration: Duration(milliseconds: 600),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
        
                scrollDirection: Axis.horizontal,
              )),
        ),
      ),
    );
  }

  _buildContainer({required String title, required String? dynamicTitle}) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10),
      child: Row(
        children: [
          Container(
            width: 150,
            child: Text(
              "$title  : ",
              style: TextStyle(fontSize: 18),
            ),
          ),
          // SizedBox(
          //   width: 70,
          // ),
          Expanded(
            child: Text(
              dynamicTitle == null ? "" : dynamicTitle,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
