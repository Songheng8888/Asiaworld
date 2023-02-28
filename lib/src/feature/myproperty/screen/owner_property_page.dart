import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:royal_landapp/src/feature/myproperty/bloc/index.dart';
import 'package:royal_landapp/src/feature/myproperty/screen/item_property.dart';
import 'package:royal_landapp/src/feature/myproperty/screen/myproperty_detail_page.dart';
import 'package:royal_landapp/src/feature/property/model/property_model.dart';
import 'package:royal_landapp/src/feature/property/screen/property_item.dart';
import 'package:transparent_image/transparent_image.dart';

class OwnerProperty extends StatefulWidget {
  const OwnerProperty({Key? key}) : super(key: key);

  @override
  _OwnerPropertyState createState() => _OwnerPropertyState();
}

class _OwnerPropertyState extends State<OwnerProperty> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MyPropertyBloc>(context).add(FetchMyPropertyStarted());
    return BlocBuilder<MyPropertyBloc, MyPropertyState>(
        builder: (context, state) {
      if (state is FetchingMyProperty) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ErrorFetchingMyProperty) {
        return Text(state.error);
      }
      print(
          "Property lenght ${BlocProvider.of<MyPropertyBloc>(context).myprolist.length}");
      return Column(
        children: [
          GridView.builder(
            cacheExtent: 0,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            // padding: EdgeInsets.only(left: 10, top: 10, right: 0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 4 / 5.5,
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 10),
            itemCount:
                BlocProvider.of<MyPropertyBloc>(context).myprolist.length,
            itemBuilder: (context, index) {
              return Item(
                // showIcon: true,
                propertyModel:
                    BlocProvider.of<MyPropertyBloc>(context).myprolist[index],
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
