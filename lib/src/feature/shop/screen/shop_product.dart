import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/property/bloc/index.dart';
import 'package:royal_landapp/src/feature/property/screen/property_item.dart';
import 'package:lottie/lottie.dart';

class ShopProduct extends StatefulWidget {
  const ShopProduct({Key? key}) : super(key: key);

  @override
  State<ShopProduct> createState() => _ShopProductState();
}

class _ShopProductState extends State<ShopProduct> {
  PropertyBloc _propertyBloc = PropertyBloc();
  @override
  void initState() {
    _propertyBloc.add(FetchPropertyStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _propertyBloc,
        builder: (context, state) {
          if (state is FetchingProperty) {
            return Center(
              child: Lottie.asset('assets/animation/97443-loading-gray.json',
                  width: 50, height: 50),
            );
          }
          if (state is ErrorFetchingProperty) {
            return Text(state.error.toString());
          }
          print("Property lenght ${_propertyBloc.propertylist.length}");
          return Column(
            children: [
              GridView.builder(
                cacheExtent: 0,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                // padding: EdgeInsets.only(left: 10, top: 10, right: 0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 4 / 6.2,
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 10),
                itemCount: _propertyBloc.propertylist.length,
                itemBuilder: (context, index) {
                  return PropertyItem(
                    // showIcon: true,
                    propertyModel: _propertyBloc.propertylist[index],
                  );
                },
              ),
            ],
          );
        });
    // return BlocProvider(
    //   create: (BuildContext context) =>
    //       PropertyBloc()..add(FetchRelatedPropertyStarted(id: id)),
    //   child: RelatedPropertyBody(),
    // );
  }
}

class RelatedPropertyBody extends StatefulWidget {
  const RelatedPropertyBody({Key? key}) : super(key: key);

  @override
  _RelatedPropertyBodyState createState() => _RelatedPropertyBodyState();
}

class _RelatedPropertyBodyState extends State<RelatedPropertyBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyBloc, PropertyState>(builder: (context, state) {
      if (state is FetchingProperty) {
        return Center(
          child: Lottie.asset('assets/animation/97443-loading-gray.json',
              width: 50, height: 50),
        );
      }
      if (state is ErrorFetchingProperty) {
        return Text(state.error);
      }
      print(
          "Property lenght ${BlocProvider.of<PropertyBloc>(context).propertylist.length}");
      return Column(
        children: [
          GridView.builder(
            cacheExtent: 0,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            // padding: EdgeInsets.only(left: 10, top: 10, right: 0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 4 / 6.5,
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 10),
            itemCount:
                BlocProvider.of<PropertyBloc>(context).propertylist.length,
            itemBuilder: (context, index) {
              return PropertyItem(
                // showIcon: true,
                propertyModel:
                    BlocProvider.of<PropertyBloc>(context).propertylist[index],
              );
            },
          ),
        ],
      );
    });
  }
}
