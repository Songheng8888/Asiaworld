// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:royal_landapp/src/feature/subscription/bloc_subscription/bloc.dart';
// import 'package:royal_landapp/src/feature/subscription/bloc_subscription/event.dart';
// import 'package:royal_landapp/src/feature/subscription/bloc_subscription/state.dart';
// import 'package:royal_landapp/src/feature/subscription/model/model_subscribtion.dart';

// class SubcriptionPage extends StatefulWidget {
//   const SubcriptionPage({Key? key}) : super(key: key);

//   @override
//   _SubcriptionPageState createState() => _SubcriptionPageState();
// }

// class _SubcriptionPageState extends State<SubcriptionPage> {
//   List<SubscriptionModel> notificationModel = [];
//   SubscriptoinBloc _notificationBloc = SubscriptoinBloc();
//   @override
//   void initState() {
//     _notificationBloc.add(FetchSubscriptionToState());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _builAppBar,
//       body: BlocBuilder(
//           bloc: _notificationBloc,
//           builder: (context, state) {
//             if (state is FetchingSubscription) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (state is ErrorSubscription) {
//               return Container(
//                 child: Text(state.error),
//               );
//             }
//             return Container(
//               padding: EdgeInsets.all(8.0),
//               child: ListView.builder(itemBuilder: (context, index) {
//                 return Container(
//                   height: 200,
//                   color: Colors.green[200],
//                   child: Card(
//                     child: Row(
//                       children: [
//                         Container(
//                           alignment: Alignment.center,
//                           height: 60,
//                           width: 60,
//                           decoration: BoxDecoration(
//                               color: Colors.red,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30.0))),
//                           child: Text(
//                             _notificationBloc.subscripModel[index].id
//                                 .toString(),
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Container(
//                           child: Text(
//                             _notificationBloc.subscripModel[index].name!,
//                             style: TextStyle(fontSize: 20, color: Colors.black),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Container(
//                           child: Text(
//                               _notificationBloc
//                                   .subscripModel[index].description!,
//                               style:
//                                   TextStyle(fontSize: 14, color: Colors.white)),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//             );
//           }),
//     );
//   }

//   get _builAppBar {
//     return AppBar(
//       title: Container(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "ជ្រើសរើសរយះពេល",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold),
//             ),
//             Container(
//               padding: EdgeInsets.only(bottom: 5),
//               height: 50,
//               width: 50,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                   image: NetworkImage(
//                       "https://scontent.fpnh20-1.fna.fbcdn.net/v/t1.15752-9/245004538_1470052286710763_5830766021133930848_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=ae9488&_nc_eui2=AeE8n4EtHQtRwzHdO92NjpunJrNOD4h9W2Yms04PiH1bZink-UnraAZQALqEB1G0_nVGxdE-XBLiY2dBbJhOF0l2&_nc_ohc=TeHjt-QHFCIAX9W0qd6&_nc_ht=scontent.fpnh20-1.fna&oh=1d5cb95b64cb2b31b0f2bf4aa3c7c35e&oe=61CE9F63"),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: Colors.indigo,
//       centerTitle: true,
//     );
//   }
// }
