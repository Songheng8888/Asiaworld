// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:royal_landapp/src/feature/list/buttom_detail.dart';
// import 'package:royal_landapp/src/feature/property/screen/property_list.dart';
// import 'package:royal_landapp/src/feature/search/model/search_model.dart';
// import 'package:royal_landapp/src/shared/bloc/index/index_event.dart';
// import 'package:royal_landapp/src/shared/bloc/indexing/indexing_bloc.dart';

// // ignore: must_be_immutable
// class SearchDetailPage extends StatelessWidget {
//   SearchModel searchModel;
//   SearchDetailPage({required this.searchModel});
//   ProperyList _properyList = ProperyList();
//   ButtomDetailPage _buttomDetailPage = ButtomDetailPage();
//   IndexingBloc indexingBloc = IndexingBloc();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar,
//       body: _buildBody,
//       bottomNavigationBar: _buttomDetailPage,
//     );
//   }

//   get _buildAppBar {
//     return AppBar(
//       backgroundColor: Colors.indigo,
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             searchModel.name!,
//             style: TextStyle(fontSize: 25, color: Colors.red),
//           ),
//           Container(
//             // alignment: Alignment.centerRight,
//             height: 50,
//             width: 50,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               image: DecorationImage(
//                 image: NetworkImage(
//                     "https://scontent.fpnh20-1.fna.fbcdn.net/v/t1.15752-9/245004538_1470052286710763_5830766021133930848_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=ae9488&_nc_eui2=AeE8n4EtHQtRwzHdO92NjpunJrNOD4h9W2Yms04PiH1bZink-UnraAZQALqEB1G0_nVGxdE-XBLiY2dBbJhOF0l2&_nc_ohc=TeHjt-QHFCIAX9W0qd6&_nc_ht=scontent.fpnh20-1.fna&oh=1d5cb95b64cb2b31b0f2bf4aa3c7c35e&oe=61CE9F63"),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget get _buildBody {
//     return ListView(
//       scrollDirection: Axis.vertical,
//       physics: BouncingScrollPhysics(),
//       children: [
//         Container(
//           height: 260,
//           width: 500,
//           child: _buildPhoto,
//         ),
//         Container(
//           padding: EdgeInsets.only(top: 10, left: 20),
//           child: Text(
//             searchModel.name!,
//             style: TextStyle(fontSize: 28, color: Colors.red),
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Container(
//           height: 350,
//           padding: EdgeInsets.only(left: 20),
//           child: Column(
//             children: [
//               Container(
//                 child: Row(
//                   children: [
//                     Text(
//                       "Price: \$",
//                       style: TextStyle(fontSize: 28, color: Colors.red),
//                     ),
//                     Container(
//                       child: searchModel.price == null
//                           ? Container()
//                           : Text(
//                               searchModel.price!,
//                               style: TextStyle(fontSize: 28, color: Colors.red),
//                             ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 10),
//                 child: Row(
//                   children: [
//                     Text(
//                       "Size : ",
//                       style: TextStyle(fontSize: 18, color: Colors.black),
//                     ),
//                     Container(
//                       child: searchModel.groundSurface == null
//                           ? Container()
//                           : Text(
//                               searchModel.groundSurface!,
//                               style:
//                                   TextStyle(fontSize: 18, color: Colors.black),
//                             ),
//                     ),
//                     Text(
//                       "  m2 ",
//                       style: TextStyle(fontSize: 18, color: Colors.black),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 10),
//                 child: Row(
//                   children: [
//                     Text(
//                       "Width :   ",
//                       style: TextStyle(fontSize: 18, color: Colors.black),
//                     ),
//                     Container(
//                       child: searchModel.width == null
//                           ? Container()
//                           : Text(
//                               searchModel.width!,
//                               style:
//                                   TextStyle(fontSize: 18, color: Colors.black),
//                             ),
//                     ),
//                     Text(
//                       "  m ",
//                       style: TextStyle(fontSize: 18, color: Colors.black),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 10),
//                 child: Row(
//                   children: [
//                     Text(
//                       "Length :   ",
//                       style: TextStyle(fontSize: 18, color: Colors.black),
//                     ),
//                     Container(
//                       child: searchModel.length == null
//                           ? Container()
//                           : Text(
//                               searchModel.length!,
//                               style:
//                                   TextStyle(fontSize: 18, color: Colors.black),
//                             ),
//                     ),
//                     Text(
//                       "  m",
//                       style: TextStyle(fontSize: 18, color: Colors.black),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 10),
//                 child: Row(
//                   children: [
//                     Text(
//                       "Type :   ",
//                       style: TextStyle(fontSize: 18, color: Colors.black),
//                     ),
//                     Container(
//                       child: searchModel.name == null
//                           ? Container()
//                           : Text(
//                               searchModel.name!,
//                               style:
//                                   TextStyle(fontSize: 18, color: Colors.black),
//                             ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 10),
//                 child: Row(
//                   children: [
//                     Text(
//                       "publish :   ",
//                       style: TextStyle(fontSize: 18, color: Colors.black),
//                     ),
//                     Container(
//                       child: searchModel.date == null
//                           ? Container()
//                           : Text(
//                               searchModel.date!,
//                               style:
//                                   TextStyle(fontSize: 18, color: Colors.black),
//                             ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 10),
//                 child: Row(
//                   children: [
//                     Text(
//                       "Village :   ",
//                       style: TextStyle(fontSize: 18, color: Colors.black),
//                     ),
//                     Container(
//                       child: searchModel.village == null
//                           ? Container()
//                           : Text(
//                               searchModel.village!,
//                               style:
//                                   TextStyle(fontSize: 18, color: Colors.black),
//                             ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 10),
//                 child: Row(
//                   children: [
//                     Text(
//                       "Commune :   ",
//                       style: TextStyle(fontSize: 18, color: Colors.black),
//                     ),
//                     Container(
//                       child: searchModel.commune == null
//                           ? Container()
//                           : Text(
//                               searchModel.commune!,
//                               style:
//                                   TextStyle(fontSize: 18, color: Colors.black),
//                             ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 10),
//                 child: Row(
//                   children: [
//                     Text(
//                       "District :   ",
//                       style: TextStyle(fontSize: 18, color: Colors.black),
//                     ),
//                     Container(
//                       child: searchModel.district == null
//                           ? Container()
//                           : Text(
//                               searchModel.district!,
//                               style:
//                                   TextStyle(fontSize: 18, color: Colors.black),
//                             ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 10),
//                 child: Row(
//                   children: [
//                     Text(
//                       "Province:   ",
//                       style: TextStyle(fontSize: 18, color: Colors.black),
//                     ),
//                     Container(
//                       child: searchModel.price == null
//                           ? Container()
//                           : Text(
//                               searchModel.province!,
//                               style:
//                                   TextStyle(fontSize: 18, color: Colors.black),
//                             ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.only(left: 20, bottom: 10),
//           child: Text(
//             "Location On Map",
//             style: TextStyle(fontSize: 26, color: Colors.indigo),
//           ),
//         ),
//         Container(
//           height: 350,
//           width: 500,
//           child: HomeGoogleMap(),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Container(
//           padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
//           child: Text(
//             "Other Properties",
//             style: TextStyle(fontSize: 26, color: Colors.indigo),
//           ),
//         ),
//         Container(
//           height: 890,
//           width: 500,
//           child: _properyList,
//         ),
//       ],
//     );
//   }

//   get _buildPhoto {
//     return ListView(
//       children: [
//         CarouselSlider(
//             items: searchModel.photo
//                 .map(
//                   (e) => Container(
//                     height: 250,
//                     margin: EdgeInsets.symmetric(horizontal: 6),
//                     padding: EdgeInsets.only(
//                       top: 5,
//                       // bottom: ((((MediaQuery.of(context).size.width /
//                       //                     100) *
//                       //                 14) -
//                       //             12) /
//                       //         2) +
//                       //     0
//                     ),
//                     width: 600,
//                     child: Container(
//                       width: 500,
//                       height: 240,
//                       // height: 230,
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.all(Radius.circular(18.0)),
//                           child: Container(
//                             // height: 400,
//                             // width: 600,
//                             child: Image.network(
//                               "${e.image}",
//                               fit: BoxFit.cover,
//                             ),
//                           )),
//                     ),
//                   ),
//                 )
//                 .toList(),
//             options: CarouselOptions(
//               onPageChanged: (index, s) {
//                 indexingBloc.add(Taped(index: index));
//               },
//               aspectRatio: 1.68,
//               viewportFraction: 0.86,
//               initialPage: 0,
//               enableInfiniteScroll: true,
//               reverse: false,
//               autoPlay: true,
//               autoPlayInterval: Duration(seconds: 3),
//               autoPlayAnimationDuration: Duration(milliseconds: 600),
//               autoPlayCurve: Curves.fastOutSlowIn,
//               enlargeCenterPage: true,
//               enlargeStrategy: CenterPageEnlargeStrategy.height,
//               scrollDirection: Axis.horizontal,
//             )),
//       ],
//     );
//   }

//   get _buildListPhoto {
//     return Container(
//       height: 300,
//       width: 500,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: 2,
//           itemBuilder: (context, index) {
//             return Row(
//               children: [
//                 Container(
//                   child: Image.network(
//                     searchModel.photo[index].image,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ],
//             );
//           }),
//     );
//   }
// }
