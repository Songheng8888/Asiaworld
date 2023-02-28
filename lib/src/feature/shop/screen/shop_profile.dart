import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal_landapp/src/feature/shop/screen/shop_product.dart';

class ShopProflie extends StatefulWidget {
  const ShopProflie({Key? key}) : super(key: key);

  @override
  State<ShopProflie> createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopProflie> {
  // ButtomDetailPage _buttomDetailPage = ButtomDetailPage();
  final List<String> imagesListUrl = [
    'https://static.vecteezy.com/system/resources/previews/004/299/835/original/online-shopping-on-phone-buy-sell-business-digital-web-banner-application-money-advertising-payment-ecommerce-illustration-search-free-vector.jpg',
    'https://static.vecteezy.com/system/resources/previews/004/299/835/original/online-shopping-on-phone-buy-sell-business-digital-web-banner-application-money-advertising-payment-ecommerce-illustration-search-free-vector.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: _buttomDetailPage,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Theme.of(context).brightness,
            elevation: 0,
            backgroundColor: Colors.transparent,
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
                  fillColor: Colors.redAccent[100],
                  child: Icon(Icons.arrow_back_rounded, color: Colors.white),
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
                      color: Colors.redAccent[100],
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Icon(Icons.favorite_outline_outlined)),
              ),

              SizedBox(
                width: 15,
              ),
              // Icon(Icons.ios_share),
              //  SizedBox(
              //   width: 10,
              // ),
            ],
            // flexibleSpace: FlexibleSpaceBar(
            //   background:
            //                       Image.network("${widget.listDeatail.img}",fit: BoxFit.cover,)
            // ),

            flexibleSpace: FlexibleSpaceBar(
              background: CarouselSlider(
                  items: imagesListUrl
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
                              // width: 600,
                              // height: 250,
                              child: Image.network(
                                "$e",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    onPageChanged: (index, s) {
                      // indexingBloc.add(Taped(index: index));
                    },
                    // aspectRatio: 1.68,
                    aspectRatio: 1.47,
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
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(width: 20,),
                      Text(
                        "Mortor Honda",
                        textScaleFactor: 2,
                        // style: TextStyle( color: Colors.red),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        // Text(
                        //   "\$ ",
                        //   textScaleFactor: 1.8,
                        //   // style: TextStyle(color: Colors.red),
                        // ),
                        Text(
                          "Phnom Penh , Kirirom",
                          textScaleFactor: 1.8,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15, right: 20),
                    child: Row(
                      children: [
                        Text(
                          "Shop Description",
                          textScaleFactor: 1.4,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15, right: 20),
                    child: Row(
                      children: [
                        Text(
                          "Contact shop",
                          textScaleFactor: 1.4,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0, right: 8.0, top: 8),
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.grey.withOpacity(0.2)),
                        //     borderRadius: BorderRadius.circular(6.0),
                        //     color: Colors.white,
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.5),
                        //     spreadRadius: 0,
                        //     blurRadius: 3,
                        //     offset: Offset(0, 0), // changes position of shadow
                        //   ),
                        // ],
                        ),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CupertinoButton(
                                  padding: EdgeInsets.all(1.0),
                                  color: Colors.green,
                                  child: Row(
                                    children: [
                                      ImageIcon(
                                        AssetImage("assets/icon/viber.png"),
                                        color: Colors.white,
                                      )
                                      // Container(
                                      //   child: Image.asset("assets/icon/linkedin.png")),
                                    ],
                                  ),
                                  onPressed: () {}),
                              SizedBox(
                                width: 5,
                              ),
                              CupertinoButton(
                                  padding: EdgeInsets.all(1.0),
                                  color: Colors.blue[700],
                                  child: Row(
                                    children: [
                                      ImageIcon(
                                        AssetImage("assets/icon/facebook.png"),
                                        color: Colors.white,
                                      )
                                      // Container(
                                      //   child: Image.asset("assets/icon/linkedin.png")),
                                    ],
                                  ),
                                  onPressed: () {}),
                              SizedBox(
                                width: 5,
                              ),
                              CupertinoButton(
                                  padding: EdgeInsets.all(1.0),
                                  color: Colors.pink[400],
                                  child: Row(
                                    children: [
                                      ImageIcon(
                                        AssetImage(
                                            "assets/icon/instagram (1).png"),
                                        color: Colors.white,
                                      )
                                      // Container(
                                      //   child: Image.asset("assets/icon/linkedin.png")),
                                    ],
                                  ),
                                  onPressed: () {}),
                              SizedBox(
                                width: 5,
                              ),
                              CupertinoButton(
                                  padding: EdgeInsets.all(1.0),
                                  color: Colors.blue,
                                  child: Row(
                                    children: [
                                      ImageIcon(
                                        AssetImage("assets/icon/telegram.png"),
                                        color: Colors.white,
                                      )
                                      // Container(
                                      //   child: Image.asset("assets/icon/linkedin.png")),
                                    ],
                                  ),
                                  onPressed: () {}),
                              SizedBox(
                                width: 5,
                              ),
                              CupertinoButton(
                                  padding: EdgeInsets.all(1.0),
                                  color: Colors.blue,
                                  child: Row(
                                    children: [
                                      ImageIcon(
                                        AssetImage(
                                            "assets/icon/twitter-sign.png"),
                                        color: Colors.white,
                                      )
                                      // Container(
                                      //   child: Image.asset("assets/icon/linkedin.png")),
                                    ],
                                  ),
                                  onPressed: () {}),
                              SizedBox(
                                width: 5,
                              ),
                              CupertinoButton(
                                  padding: EdgeInsets.all(1.0),
                                  color: Colors.red,
                                  child: Row(
                                    children: [
                                      ImageIcon(
                                        AssetImage("assets/icon/youtube.png"),
                                        color: Colors.white,
                                      )
                                      // Container(
                                      //   child: Image.asset("assets/icon/linkedin.png")),
                                    ],
                                  ),
                                  onPressed: () {}),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  // _buildContainer(title: "fb", dynamicTitle: "Kirirom "),
                  // _buildContainer(
                  //     title: "Phone number", dynamicTitle: "010601168"),
                  // _buildContainer(title: "Telegram", dynamicTitle: "010601168"),
                  // _buildContainer(title: "Type", dynamicTitle: "House"),
                  // _buildContainer(
                  //     title: "Province",
                  //     dynamicTitle: widget.listDeatail.province),
                  // _buildContainer(title: "Date", dynamicTitle: "10/02/2022"),
                  // Container(
                  //     margin: EdgeInsets.only(left: 10, right: 10),
                  //     child: Divider()),

                  Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Divider()),
                  Container(
                    padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                    child: Row(
                      children: [
                        Text(
                          "Shop Product",
                          textScaleFactor: 1.4,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: ShopProduct(
                        // id: widget.listDeatail.id,
                        ),
                  ),
                ],
              ),
            ),
            // child: GridView.builder(
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2),
            //     primary: false,
            //     shrinkWrap: true,
            //     itemCount: 10,
            //     itemBuilder: (context, index) => Container(
            //           color: Colors.blue,
            //           child: Text("Hi"),
            //         )),
          )
        ],
      ),
    );
    //   return Scaffold(
    //     body: CustomScrollView(
    //       physics: BouncingScrollPhysics(),
    //       slivers: [
    //         SliverAppBar(
    //           pinned: true,
    //           title: Text('Pinned AppBar'),
    //         ),
    //         SliverPersistentHeader(
    //           pinned: false,
    //           floating: true,
    //           delegate: FloatingHeader(propertyModel: widget.listDeatail),
    //         ),
    //         SliverList(
    //             delegate: SliverChildListDelegate([
    //           Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 widget.listDeatail.propertyName,
    //                 style: TextStyle(fontSize: 28, color: Colors.red),
    //               ),
    //             ],
    //           ),
    //           Container(
    //             padding: EdgeInsets.only(left: 30, top: 8),
    //             child: Row(
    //               children: [
    //                 Text(
    //                   "\$ ",
    //                   style: TextStyle(fontSize: 28, color: Colors.red),
    //                 ),
    //                 Text(
    //                   widget.listDeatail.propertyPrice!,
    //                   style: TextStyle(fontSize: 28, color: Colors.red),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           _buildContainer(
    //               title: "Size", dynamicTitle: widget.listDeatail.size),
    //           _buildContainer(title: "Width", dynamicTitle: "100"),
    //           _buildContainer(title: "Lenght", dynamicTitle: "200"),
    //           _buildContainer(title: "Type", dynamicTitle: "House"),
    //           _buildContainer(
    //               title: "Province", dynamicTitle: widget.listDeatail.province),
    //           _buildContainer(title: "Date", dynamicTitle: "10/02/2022"),
    //           // _buildContainer(title: "Type", dynamicTitle: "House"),

    //           Container(
    //             padding: EdgeInsets.only(top: 15),
    //             height: 450,
    //             width: 500,
    //             child: HomeGoogleMap(
    //               lat: widget.listDeatail.lat,
    //               lon: widget.listDeatail.long,
    //             ),
    //           ),
    //           Container(
    //             padding: EdgeInsets.only(top: 10, bottom: 10),
    //             child: Row(
    //               children: [
    //                 Text(
    //                   "Other related properties",
    //                   textScaleFactor: 1.4,
    //                   style: TextStyle(
    //                       color: Colors.indigo, fontWeight: FontWeight.bold),
    //                 )
    //               ],
    //             ),
    //           ),
    //           RelatedProperty(
    //             id: widget.listDeatail.id,
    //           ),
    //           // Container(
    //           //     height: MediaQuery.of(context).size.height,
    //           //     color: Colors.white,
    //           //     child: Center(
    //           //         child: Column(
    //           //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           //             children: [
    //           //           Text('TOP'),
    //           //           Text('MIDDLE'),
    //           //           Text('BOTTOM'),
    //           //         ]))),
    //         ]))
    //       ],
    //     ),
    //   );
    // }

    // _buildContainer({required String title, required String? dynamicTitle}) {
    //   return Container(
    //     padding: EdgeInsets.only(left: 30, top: 10),
    //     child: Row(
    //       children: [
    //         Text(
    //           "$title  : ",
    //           style: TextStyle(fontSize: 18),
    //         ),
    //         SizedBox(
    //           width: 70,
    //         ),
    //         Text(
    //           dynamicTitle == null ? "" : dynamicTitle,
    //           style: TextStyle(fontSize: 18),
    //         ),
    //         // Text(
    //         //   "m2",
    //         //   style: TextStyle(fontSize: 15),
    //         // )
    //       ],
    //     ),
    //   );
  }

  _buildContainer({required String title, required String? dynamicTitle}) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10),
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
  //  buildImage()=>SliverToBoxAdapter(
  //   child: GridView.builder(
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
  //     primary: false,
  //     shrinkWrap: true,
  //     itemCount: 10,
  //      itemBuilder: (context,index)=>Container(
  //        color: Colors.blue,
  //        child: Text("Hi")
  //        ,
  //      )),
  // );
}

// class FloatingHeader extends SliverPersistentHeaderDelegate {
//   final PropertyModel propertyModel;
//   FloatingHeader({required this.propertyModel});
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       // height: 350,
//       // color: Colors.red,
//       child: CarouselSlider(
//           items: propertyModel.photoModel!
//               .map(
//                 (e) => Container(
//                   // height: 250,
//                   // margin: EdgeInsets.symmetric(horizontal: 6),
//                   padding: EdgeInsets.only(
//                     top: 5,
//                     // bottom: ((((MediaQuery.of(context).size.width /
//                     //                     100) *
//                     //                 14) -
//                     //             12) /
//                     //         2) +
//                     //     0
//                   ),
//                   width: MediaQuery.of(context).size.width,
//                   child: Container(
//                     width: 500,
//                     height: 240,
//                     // height: 230,
//                     child: ClipRRect(
//                         // borderRadius: BorderRadius.all(
//                         //     Radius.circular(18.0)),
//                         child: Container(
//                       // height: 400,
//                       // width: 600,
//                       child: Image.network(
//                         "${e.image}",
//                         fit: BoxFit.cover,
//                       ),
//                     )),
//                   ),
//                 ),
//               )
//               .toList(),
//           options: CarouselOptions(
//             onPageChanged: (index, s) {
//               // indexingBloc.add(Taped(index: index));
//             },
//             // aspectRatio: 1.68,
//             aspectRatio: 2.27,
//             viewportFraction: 1,
//             initialPage: 0,
//             enableInfiniteScroll: true,
//             reverse: false,
//             autoPlay: true,
//             // autoPlayInterval: Duration(seconds: 3),
//             autoPlayAnimationDuration: Duration(milliseconds: 600),
//             autoPlayCurve: Curves.fastOutSlowIn,
//             enlargeCenterPage: false,
//             // enlargeStrategy: CenterPageEnlargeStrategy.height,
//             scrollDirection: Axis.horizontal,
//           )),
//     );
//   }

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;

//   @override
//   double get maxExtent => 350.0;

//   @override
//   double get minExtent => 80.0;
// }
