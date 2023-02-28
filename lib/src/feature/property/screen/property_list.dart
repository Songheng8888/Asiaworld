import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/property/bloc/index.dart';
import 'package:royal_landapp/src/feature/property/screen/property_by_id.dart';
import 'package:royal_landapp/src/feature/property/screen/property_item.dart';
import 'package:royal_landapp/src/feature/propertytype/model/propertytype_model.dart';

class ProperyList extends StatefulWidget {
  final PropertyTypeModel? propertyTypeModel;
  final bool isHorizontal;
  const ProperyList({required this.propertyTypeModel, required this.isHorizontal});

  @override
  _ProperyListState createState() => _ProperyListState();
}

class _ProperyListState extends State<ProperyList> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PropertyBloc>(context).add(FetchPropertyStarted());
    print(widget.isHorizontal);
    if (widget.isHorizontal == false) {
      return BlocBuilder<PropertyListingBloc, PropertyListingState>(
          builder: (BuildContext context, PropertyListingState state) {
        if (BlocProvider.of<PropertyListingBloc>(context).productList.length == 0) {
          return Container(
            width: 0,
            height: 0,
          );
        }

        return Container(
          margin: EdgeInsets.only(left: 5, right: 0),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: BlocProvider.of<PropertyListingBloc>(context).productList.length,
            itemBuilder: (context, index) {
              return Container(
                height: 800,
                width: 180,
                margin: EdgeInsets.only(right: 8),
                child: PropertyItem(
                  isVerticalParent: false,
                  //showIcon: true,
                  propertyModel: BlocProvider.of<PropertyListingBloc>(context).productList[index],
                ),
              );
            },
          ),
        );
      });
    }
    return PropertyById(
      propertyTypeModel: widget.propertyTypeModel!,
    );
  }
}
