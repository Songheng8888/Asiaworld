import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:royal_landapp/src/feature/banner/screen/baner_page.dart';
import 'package:royal_landapp/src/feature/home/screen/app_bar.dart';
import 'package:royal_landapp/src/feature/property/bloc/index.dart';
import 'package:royal_landapp/src/feature/property/repository/property_listing_repository.dart';
import 'package:royal_landapp/src/feature/propertytype/bloc/index.dart';
import 'package:royal_landapp/src/feature/propertytype/screen/home_category.dart';
import 'home_property_by_cate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: appBar(context: context),
      ),
      body: BlocProvider(
          create: (BuildContext context) =>
              PropertyListingBloc(productListingRepository: PropertyListRepo())
                ..add(InitializeProductListingStarted(arg: null)),
          child: Container(child: Body())),
    );
  }
}

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PropertyListingBloc, PropertyListingState>(
      listener: (context, state) {
        print(state);
        if (state is InitializedProductListing) {
          _refreshController.loadComplete();
          _refreshController.loadNoData();
        }
        if (state is FetchedPropertyListing) {
          _refreshController.loadComplete();
          _refreshController.refreshCompleted();
        }
        if (state is EndOfPropertyListing) {
          _refreshController.loadNoData();
          _refreshController.loadComplete();
        }
      },
      child: SmartRefresher(
        cacheExtent: 1,
        onRefresh: () {
          BlocProvider.of<PropertyListingBloc>(context)
              .add(RefreshPropertyListingStarted(arg: null));
        },
        onLoading: () {
          BlocProvider.of<PropertyListingBloc>(context)
              .add(FetchPropertyListingStarted(arg: null));
        },
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshController,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.red,
                child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: BannerPage()),
              ),
              Container(
                color: Colors.red,
                height: MediaQuery.of(context).size.height / 2,
                child: HomeCategory(),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    BlocBuilder<PropertyTypeBloc, PropertyTypeState>(
                      builder: (context, dynamic state) {
                        if (state is FetchingPropertyType) {
                          return Container();
                        } else if (state is ErrorFetchingPropertyType) {
                          return Container(
                              child: Center(
                            child: CircularProgressIndicator(),
                          ));
                        } else {
                          print(BlocProvider.of<PropertyTypeBloc>(context)
                              .propertytypelist
                              .length);
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                BlocProvider.of<PropertyTypeBloc>(context)
                                    .propertytypelist
                                    .length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => BlocProvider(
                              create: (BuildContext context) =>
                                  PropertyListingBloc(
                                      productListingRepository:
                                          PropertyListByCateRepo(),
                                      rowPerPage: 3)
                                    ..add(InitializeProductListingStarted(
                                        arg: BlocProvider.of<PropertyTypeBloc>(
                                                context)
                                            .propertytypelist[index]
                                            .id)),
                              child: HomePropertyListByCate(
                                propertyTypeModel:
                                    BlocProvider.of<PropertyTypeBloc>(context)
                                        .propertytypelist[index],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
