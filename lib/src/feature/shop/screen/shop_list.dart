import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/feature/shop/bloc/index.dart';
import 'package:royal_landapp/src/feature/shop/screen/shop_item.dart';
import 'package:lottie/lottie.dart';

class ShopList extends StatefulWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  State<ShopList> createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  ShopBloc _companyBloc = ShopBloc();
  @override
  void initState() {
    _companyBloc.add(FetchShopStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: _companyBloc,
        builder: (context, state) {
          if (state is InitailizingShop) {
            return Center(
              child:
                  Lottie.asset('assets/animation/97443-loading-gray.json', width: 50, height: 50),
            );
          }
          if (state is ErrorFetchingShop) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          return ShopItem(
            companyModel: _companyBloc.companyModel,
          );
        },
        listener: (context, state) {});
  }

  @override
  void dispose() {
    _companyBloc.close();
    super.dispose();
  }
}
