import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBar standardAppBar(BuildContext context, String text) {
  return AppBar(
    brightness: Brightness.light,
    elevation: 0,
    backgroundColor: Colors.red,
    // backgroundColor: Colors.transparent,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios_outlined,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    centerTitle: true,
    title: Text(
      text,
      style: TextStyle(color: Colors.white, fontFamily: 'BattambangRegular'),
      textScaleFactor: 1.1,
    ),
  );
}




// appbarLogo(BuildContext context) {
//   return PreferredSize(
//     preferredSize: Size(double.infinity, 100),
//     child: Container(
//       width: MediaQuery.of(context).size.width,
//       height: 100,
//       child: Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20))),
//         child: Container(
//           margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                   width: 150,
//                   height: 100,
//                   child: Image(image: AssetImage("assets/icon/logo1.jpg"))
//                   // Image.asset('assets/icon/logo1.png')
//                   ),
//               Row(
//                 children: [
//                   Badge(
//                     position: BadgePosition.topEnd(top: 4, end: 6),
//                     // animationDuration: Duration(milliseconds: 300),
//                     badgeContent: BlocBuilder<CartBloc, CartState>(
//                       builder: (context, state) {
//                         print(state);
//                         if (state is FetchedCart) {
//                           print(
//                               "cart length:${BlocProvider.of<CartBloc>(context).cart.data!.length}");
//                           return Text(
//                             "${BlocProvider.of<CartBloc>(context).cart.data!.length.toString()}",
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                             textScaleFactor: 0.6,
//                           );
//                         }
//                         // return Container();
//                         return Text('0',
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                             textScaleFactor: 0.6);
//                       },
//                     ),
//                     child: IconButton(
//                       icon: Icon(Icons.notifications_outlined),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => AnnouncementPage(),
//                             ));
//                       },
//                     ),
//                   ),
//                   // InkWell(
//                   //     onTap: () {
//                   //       Navigator.push(
//                   //           context,
//                   //           MaterialPageRoute(
//                   //             builder: (_) => AnnouncementPage(),
//                   //           ));
//                   //     },
//                   //     child: Icon(
//                   //       Icons.notifications_outlined,
//                   //       color: Colors.black,
//                   //     )),
//                   // IconButton(
//                   //     icon: Icon(
//                   //       Icons.speaker_notes_outlined,
//                   //       color: Colors.black,
//                   //     ),
//                   //     onPressed: () {
//                   //       Navigator.push(context,
//                   //           MaterialPageRoute(builder: (con) => DiscussPage()));
//                   //     }),
//                   Badge(
//                     position: BadgePosition.topEnd(top: 4, end: 6),
//                     // animationDuration: Duration(milliseconds: 300),
//                     badgeContent: BlocBuilder<CartBloc, CartState>(
//                       builder: (context, state) {
//                         print(state);
//                         if (state is FetchedCart) {
//                           print(
//                               "cart length:${BlocProvider.of<CartBloc>(context).cart.data!.length}");
//                           return Text(
//                             "${BlocProvider.of<CartBloc>(context).cart.data!.length.toString()}",
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                             textScaleFactor: 0.6,
//                           );
//                         }
//                         // return Container();
//                         return Text('0',
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                             textScaleFactor: 0.6);
//                       },
//                     ),
//                     child: IconButton(
//                       icon: Icon(Icons.shopping_cart_outlined),
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (_) => CartPage()));
//                       },
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(right: 10),
//                     child: InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (con) => SearchPage()));
//                           // showSearch(
//                           //     context: context, delegate: SearchPage());
//                         },
//                         child: Icon(
//                           Icons.search,
//                           color: Colors.black,
//                         )),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
