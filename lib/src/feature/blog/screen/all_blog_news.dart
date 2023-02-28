// import 'package:flutter/material.dart';

// class AllBlogNews extends StatefulWidget {
//   const AllBlogNews({ Key? key }) : super(key: key);

//   @override
//   _AllBlogNewsState createState() => _AllBlogNewsState();
// }

// class _AllBlogNewsState extends State<AllBlogNews> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder(
//         bloc: HomeState.bottomNavigationPagesInvokingBloc[2],
//         builder: (context, state) {
//           print(state);
//           if (state is Invoked) {
//             return MultiBlocProvider(providers: [
//               BlocProvider(
//                 create: (BuildContext context) =>
//                     CategoryBlogBloc()..add(FecthedCategoryBlogStarted()),
//               ),
//               // BlocProvider(
//               //   create: (BuildContext context) =>
//               //       BlogListingBloc(blogListingRepository: BlogListRepo())
//               //         ..add(InitializeBlogList()),
//               // )
//             ], child: Body());
//           }
//           // return Body();
//           return BlocProvider(
//             create: (BuildContext context) =>
//                 CategoryBlogBloc()..add(FecthedCategoryBlogStarted()),
//             child: Body(),
//           );
//         });
//   }
// }

// class Body extends StatefulWidget {
//   // const Body({Key key}) : super(key: key);

//   @override
//   _BodyState createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   @override
//   Widget build(BuildContext context) {
//     BlocProvider.of<CategoryBlogBloc>(context)
//       ..add(FecthedCategoryBlogStarted());

//     return BlocBuilder<CategoryBlogBloc, CategoryBlogState>(
//       builder: (context, state) {
//         print(state);
//         if (state is ErrorFetchingCategoryBlog) {
//           return Center(
//             child: Text(state.error.toString()),
//           );
//         } else if (state is FetchedCategoryBlog) {
//           print(BlocProvider.of<CategoryBlogBloc>(context)
//               .categoryBlogModel
//               .length);
//           return DefaultTabController(
//               initialIndex: 0,
//               length: 1 +
//                   BlocProvider.of<CategoryBlogBloc>(context)
//                       .categoryBlogModel
//                       .length,
//               child: Scaffold(
//                 appBar: AppBar(
//                   brightness: Brightness.light,
//                   elevation: 0,
//                   backgroundColor: Colors.white,
//                   centerTitle: true,
//                   // leading: IconButton(
//                   //     icon: Icon(
//                   //       Icons.arrow_back_ios_outlined,
//                   //       color: Colors.black,
//                   //     ),
//                   //     onPressed: () {
//                   //       Navigator.pop(context);
//                   //     }),
//                   title: Text(
//                     'Blog',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   bottom: PreferredSize(
//                     preferredSize: Size.fromHeight(kToolbarHeight),
//                     child: Align(
//                       alignment: Alignment.topLeft,
//                       child: TabBar(
//                         indicatorSize: TabBarIndicatorSize.label,
//                         isScrollable: true,
//                         //  (_blogCategoryBloc.subCategoryList.length == 0)
//                         //     ? false
//                         //     : true,
//                         indicatorColor: Theme.of(context).primaryColor,
//                         labelColor: Theme.of(context).primaryColor,
//                         unselectedLabelColor: Colors.black,
//                         tabs: [
//                           Container(
//                             padding: EdgeInsets.all(1),
//                             child: Tab(
//                               text: "All",
//                             ),
//                           ),
//                           ...BlocProvider.of<CategoryBlogBloc>(context)
//                               .categoryBlogModel
//                               .map((category) => Tab(text: category.name))
//                               .toList()
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 body: TabBarView(
//                   children: [
//                     // for all blog
//                     BlocProvider(
//                         create: (BuildContext context) => BlogListingBloc(
//                             blogListingRepository: BlogListRepo())
//                           ..add(InitializeBlogList()),
//                         child: TabBarContent()),
//                     // for blog by category
//                     ...BlocProvider.of<CategoryBlogBloc>(context)
//                         .categoryBlogModel
//                         .map(
//                           (blogCategory) => BlocProvider(
//                               create: (context) => BlogListingBloc(
//                                   blogListingRepository:
//                                       BlogListByCategoryRepo())
//                                 ..add(InitializeBlogList(
//                                     arg: blogCategory.id.toString())),
//                               child: BlogListByCategory(
//                                 blogCategory: blogCategory,
//                               )
//                               //_body(subCategory.id.toString()),
//                               ),
//                         )
//                         .toList()
//                   ],
//                 ),
//               ));
//         }

//         return Container(
//           child: Center(
//             child: CircularProgressIndicator(),
//           ),
//         );
//       },
//     );
//   }
// }

// class TabBarContent extends StatefulWidget {
//   // const TabBarContent({Key key}) : super(key: key);

//   @override
//   _TabBarContentState createState() => _TabBarContentState();
// }

// class _TabBarContentState extends State<TabBarContent>
//     with AutomaticKeepAliveClientMixin {
//   final RefreshController _refreshController = RefreshController();
//   @override
//   bool get wantKeepAlive => true;
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return BlocListener<BlogListingBloc, BlogListingState>(
//       listener: (context, state) {
//         if (state is InitializedBlogList || state is FetchedBlogList) {
//           _refreshController.loadComplete();
//           _refreshController.refreshCompleted();
//         }
//         if (state is EndOfBlogList) {
//           _refreshController.loadNoData();
//         }
//       },
//       child: SmartRefresher(
//         cacheExtent: 1,
//         // cacheExtent: 500,
//         physics: AlwaysScrollableScrollPhysics(),
//         onRefresh: () {
//           BlocProvider.of<BlogListingBloc>(context).add(InitializeBlogList());
//         },
//         onLoading: () {
//           if (BlocProvider.of<BlogListingBloc>(context).state
//               is EndOfBlogList) {
//           } else {
//             BlocProvider.of<BlogListingBloc>(context)
//                 .add(FetchBlogList(arg: null));
//           }
//         },
//         enablePullDown: true,
//         enablePullUp: true,
//         controller: _refreshController,
//         child: SingleChildScrollView(
//           child: Column(
//             // addAutomaticKeepAlives: true,
//             children: [
//               BlogList()
//               // BlocBuilder<CategoryBlogBloc, CategoryBlogState>(
//               //   builder: (context, state) {
//               //     if (state is FetchingCategoryBlog) {
//               //       return Container();
//               //       // return Center(child: CircularProgressIndicator());
//               //     } else if (state is ErrorFetchingCategoryBlog) {
//               //       return Container();
//               //     } else {
//               //       return Container();

//               //     }
//               //   },
//               // ),
//               // SizedBox(height: 15),
//               // Container(
//               //   alignment: Alignment.centerLeft,
//               //   margin: EdgeInsets.only(left: 10, right: 0),
//               //   //alignment: Alignment.centerLeft,
//               //   child: Text("Feature",
//               //       textScaleFactor: 1.1,
//               //       style: TextStyle(
//               //           letterSpacing: 1,
//               //           color: Theme.of(context).textTheme.headline1!.color,
//               //           fontWeight: FontWeight.w500)),
//               // ),
//               // BlogList()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
