import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/propertytype/bloc/index.dart';
import 'package:royal_landapp/src/feature/propertytype/screen/widget/type_item.dart';
import 'widget/more_icon.dart';

class HomeCategory extends StatefulWidget {
  const HomeCategory({Key? key}) : super(key: key);

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  final List<String> imagesListUrl = [
    'assets/category/electronic.jpg',
    'assets/category/car.jpg',
    'assets/category/motoby.jpg',
    'assets/category/ASUS.jpg',
    'assets/category/furniture1.jpg',
    'assets/category/ipone.jpg',
    'assets/category/land.jpg',
    'assets/category/apatment1.jpg',
    'assets/category/house2.jpg',
    'assets/category/shop_house.jfif',
  ];
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PropertyTypeBloc>(context).add(FetchPropertyTypeStarted());
    return BlocBuilder<PropertyTypeBloc, PropertyTypeState>(
        builder: (context, state) {
      if (state is FetchingPropertyType) {
        return Center();
      }
      if (state is ErrorFetchingPropertyType) {
        return Center(
          child: Text(state.error.toString()),
        );
      }
      return Container(
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: BlocProvider.of<PropertyTypeBloc>(context)
                        .propertytypelist
                        .length >
                    9
                ? 9
                : BlocProvider.of<PropertyTypeBloc>(context)
                    .propertytypelist
                    .length,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3 / 3,
                crossAxisSpacing: 10,
                crossAxisCount: 3,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return index == 8
                  ? moreIcon(context)
                  : typeItem(
                      context,
                      BlocProvider.of<PropertyTypeBloc>(context)
                          .propertytypelist[index],
                      imagesListUrl[index]);
            }),
      );
    });
  }
}
