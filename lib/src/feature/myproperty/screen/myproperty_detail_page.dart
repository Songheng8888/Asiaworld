import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:royal_landapp/src/feature/list/buttom_detail.dart';
import 'package:royal_landapp/src/feature/myproperty/screen/edit_property_page.dart';
import 'package:royal_landapp/src/feature/property/model/property_model.dart';
import 'package:royal_landapp/src/feature/property/screen/widget/property_map.dart';
import 'package:royal_landapp/src/feature/property/screen/widget/related_properties.dart';
import 'package:royal_landapp/src/shared/bloc/indexing/indexing_bloc.dart';

class MyPropertyDetail extends StatelessWidget {
  PropertyModel listDeatail;
  MyPropertyDetail({required this.listDeatail});
  ButtomDetailPage _buttomDetailPage = ButtomDetailPage();
  IndexingBloc indexingBloc = IndexingBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (con) => EditProperty(
                              propertyModel: listDeatail,
                            )));
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // physics: BouncingScrollPhysics(),
          // shrinkWrap: false,
          children: [
            CarouselSlider(
                items: listDeatail.photoModel!
                    .map(
                      (e) => Container(
                        // height: 250,
                        // margin: EdgeInsets.symmetric(horizontal: 6),
                        padding: EdgeInsets.only(
                          top: 5,
                          // bottom: ((((MediaQuery.of(context).size.width /
                          //                     100) *
                          //                 14) -
                          //             12) /
                          //         2) +
                          //     0
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          width: 500,
                          height: 240,
                          // height: 230,
                          child: ClipRRect(
                              // borderRadius: BorderRadius.all(
                              //     Radius.circular(18.0)),
                              child: Container(
                            // height: 400,
                            // width: 600,
                            child: Image.network(
                              "${e.image}",
                              fit: BoxFit.cover,
                            ),
                          )),
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  onPageChanged: (index, s) {
                    // indexingBloc.add(Taped(index: index));
                  },
                  // aspectRatio: 1.68,
                  aspectRatio: 2.27,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  // autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 600),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  // enlargeStrategy: CenterPageEnlargeStrategy.height,
                  scrollDirection: Axis.horizontal,
                )),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listDeatail.propertyName!,
                  style: TextStyle(fontSize: 28, color: Colors.red),
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.only(left: 30, top: 8),
              child: Row(
                children: [
                  Text(
                    "\$ ",
                    style: TextStyle(fontSize: 28, color: Colors.red),
                  ),
                  Text(
                    listDeatail.propertyPrice!,
                    style: TextStyle(fontSize: 28, color: Colors.red),
                  ),
                ],
              ),
            ),
            _buildContainer(title: "Size", dynamicTitle: listDeatail.size),
            _buildContainer(title: "Width", dynamicTitle: "100"),
            _buildContainer(title: "Lenght", dynamicTitle: "200"),
            _buildContainer(title: "Type", dynamicTitle: "House"),
            _buildContainer(
                title: "Province", dynamicTitle: listDeatail.province),
            _buildContainer(title: "Date", dynamicTitle: "10/02/2022"),
            // _buildContainer(title: "Type", dynamicTitle: "House"),

            listDeatail.lat == null && listDeatail.long == null
                ? Container()
                : Container(
                    padding: EdgeInsets.only(top: 15),
                    height: 450,
                    width: 500,
                    child: PropertyMap(
                      lat: listDeatail.lat,
                      lon: listDeatail.long,
                    ),
                  ),
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Text(
                    "Other related properties",
                    textScaleFactor: 1.4,
                    style: TextStyle(
                        color: Colors.indigo, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            RelatedProperty(
              id: listDeatail.id,
            ),
            // Container(
            //   height: MediaQuery.of(context).size.height,
            //   padding: EdgeInsets.only(
            //     top: 10,
            //   ),
            //   child: RelatedProperty(
            //     id: listDeatail.id,
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: _buttomDetailPage,
    );
  }

  _buildContainer({required String title, required String? dynamicTitle}) {
    return Container(
      padding: EdgeInsets.only(left: 30, top: 10),
      child: Row(
        children: [
          Text(
            "$title  : ",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            width: 70,
          ),
          Text(
            dynamicTitle == null ? "" : dynamicTitle,
            style: TextStyle(fontSize: 18),
          ),
          // Text(
          //   "m2",
          //   style: TextStyle(fontSize: 15),
          // )
        ],
      ),
    );
  }
}
