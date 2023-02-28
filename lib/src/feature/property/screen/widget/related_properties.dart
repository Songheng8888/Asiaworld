import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/property/bloc/index.dart';
import 'package:royal_landapp/src/feature/property/bloc/property_bloc.dart';
import 'package:royal_landapp/src/feature/property/bloc/property_event.dart';
import 'package:royal_landapp/src/feature/property/screen/property_item.dart';
import 'package:lottie/lottie.dart';

class RelatedProperty extends StatelessWidget {
  final String id;
  const RelatedProperty({required this.id});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PropertyBloc>(context)
        .add(InitailizeRelatedStarted(id: id, isRefresh: false));
    return BlocBuilder<PropertyBloc, PropertyState>(builder: (context, state) {
      if (state is InitailizingProperty) {
        return Center(
          child: Lottie.asset('assets/animation/97443-loading-gray.json',
              width: 50, height: 50),
        );
      }
      if (state is ErrorFetchingProperty) {
        return Text(state.error.toString());
      }

      return Column(
        children: [
          GridView.builder(
            cacheExtent: 0,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 4 / 6.2,
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 10),
            itemCount:
                BlocProvider.of<PropertyBloc>(context).propertylist.length,
            itemBuilder: (context, index) {
              return PropertyItem(
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
