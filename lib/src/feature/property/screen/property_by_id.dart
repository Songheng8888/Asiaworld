import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:royal_landapp/src/feature/property/bloc/index.dart';
import 'package:royal_landapp/src/feature/property/screen/property_item.dart';
import 'package:royal_landapp/src/feature/propertytype/model/propertytype_model.dart';
import 'package:royal_landapp/src/utils/share/appbar.dart';
import 'package:lottie/lottie.dart';

class PropertyById extends StatefulWidget {
  final PropertyTypeModel propertyTypeModel;
  const PropertyById({required this.propertyTypeModel});

  @override
  _PropertyByIdState createState() => _PropertyByIdState();
}

class _PropertyByIdState extends State<PropertyById> {
  final RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PropertyBloc>(context).add(InitailizepropertyByIdStarted(
        id: widget.propertyTypeModel.id!, isRefresh: false));
    return Scaffold(
      appBar: standardAppBar(context, "${widget.propertyTypeModel.name}"),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: BlocConsumer(
            bloc: BlocProvider.of<PropertyBloc>(context),
            builder: (context, state) {
              print(state);
              if (state is InitailizingProperty) {
                return Center(
                  child: Lottie.asset(
                      'assets/animation/97443-loading-gray.json',
                      width: 50,
                      height: 50),
                );
              }
              if (state is ErrorFetchingProperty) {
                return Center(
                  child: Text(state.error.toString()),
                );
              }

              return SmartRefresher(
                cacheExtent: 1,
                onRefresh: () {
                  BlocProvider.of<PropertyBloc>(context).add(
                      InitailizepropertyByIdStarted(
                          id: widget.propertyTypeModel.id!, isRefresh: true));
                },
                onLoading: () {
                  BlocProvider.of<PropertyBloc>(context).add(
                      FetchPropertyByIdStarted(
                          id: widget.propertyTypeModel.id!));
                },
                enablePullDown: true,
                enablePullUp: true,
                controller: _refreshController,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GridView.builder(
                        cacheExtent: 0,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 4 / 6.2,
                            crossAxisCount: 2,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4),
                        itemCount: BlocProvider.of<PropertyBloc>(context)
                            .probyId
                            .length,
                        itemBuilder: (context, index) {
                          return PropertyItem(
                            isVerticalParent: true,
                            propertyModel:
                                BlocProvider.of<PropertyBloc>(context)
                                    .probyId[index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            listener: (context, state) {
              if (state is FetchedProperty) {
                _refreshController.loadComplete();
                _refreshController.refreshCompleted();
              }
              if (state is EndofPropertyList) {
                _refreshController.loadNoData();
                // _refreshController.loadComplete();
              }
            }),
      ),
    );
  }
}
