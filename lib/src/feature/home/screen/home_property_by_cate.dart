import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:royal_landapp/src/constants/app_constant.dart';
import 'package:royal_landapp/src/feature/property/bloc/index.dart';
import 'package:royal_landapp/src/feature/property/screen/property_list.dart';
import 'package:royal_landapp/src/feature/propertytype/model/propertytype_model.dart';

class HomePropertyListByCate extends StatefulWidget {
  final PropertyTypeModel propertyTypeModel;
  const HomePropertyListByCate({required this.propertyTypeModel});

  @override
  State<HomePropertyListByCate> createState() => _HomePropertyListByCateState();
}

class _HomePropertyListByCateState extends State<HomePropertyListByCate> {
  final RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyListingBloc, PropertyListingState>(
      builder: (context, state) {
        if (state is InitializingProductListing) {
          return Container();
        }
        if (BlocProvider.of<PropertyListingBloc>(context).productList.length <= 1) {
          return Center();
        }
        return Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width * 0.95,
              margin: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    "${widget.propertyTypeModel.name!.toUpperCase()}",
                    style: TextStyle(
                        fontFamily: 'btb',
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                    textScaleFactor: 1.1,
                  )),
                  Text(
                    "See more",
                    style: TextStyle(fontFamily: 'btb', color: Colors.blue),
                    textScaleFactor: 1,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            BlocListener<PropertyListingBloc, PropertyListingState>(
              listener: (context, state) async {
                if (state is FetchedPropertyListing) {
                  _refreshController.loadComplete();
                  _refreshController.refreshCompleted();
                }
                if (state is EndOfPropertyListing) {
                  _refreshController.loadNoData();
                }
              },
              child: Container(
                height: 300,
                child: SmartRefresher(
                  scrollDirection: Axis.horizontal,
                  enablePullDown: false,
                  enablePullUp: true,
                  controller: _refreshController,
                  child:
                      ProperyList(isHorizontal: false, propertyTypeModel: widget.propertyTypeModel),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        );
      },
    );
  }
}
