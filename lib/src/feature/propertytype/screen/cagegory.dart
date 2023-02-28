import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/constants/app_constant.dart';
import 'package:royal_landapp/src/feature/categories/widget/categogy.dart';
import 'package:royal_landapp/src/feature/property/screen/property_list.dart';
import 'package:royal_landapp/src/feature/propertytype/bloc/index.dart';
import 'package:royal_landapp/src/feature/propertytype/model/propertytype_model.dart';

class AllCategory extends StatefulWidget {
  bool? isAll;
  AllCategory({this.isAll = false});

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
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
  List<String> image = [
    'assets/icon/flash.png',
    'assets/icon/steering-wheel.png',
    'assets/icon/scooter-front-view.png',
    'assets/icon/laptop.png'
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BlocProvider.of<PropertyTypeBloc>(context).add(FetchPropertyTypeStarted());
    print(widget.isAll);
    return Scaffold(
      // appBar: _buildAppBar(),
      // body: BlocBuilder<PropertyTypeBloc, PropertyTypeState>(
      //     builder: (context, state) {
      //   if (state is FetchingPropertyType) {
      //     return Center(
      //       child: Lottie.asset('assets/animation/97443-loading-gray.json',
      //           width: 50, height: 50),
      //     );
      //   }
      //   if (state is ErrorFetchingPropertyType) {
      //     return Center(
      //       child: Text(state.error.toString()),
      //     );
      //   }
      //   return Container(
      //     padding: EdgeInsets.all(10),
      //     child: SingleChildScrollView(
      //       child: GridView.builder(
      //         cacheExtent: 1000,
      //         physics: NeverScrollableScrollPhysics(),
      //         shrinkWrap: true,
      //         // padding: EdgeInsets.only(left: 10, top: 10, right: 0),
      //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //             childAspectRatio: 4 / 4.2,
      //             crossAxisCount: 2,
      //             crossAxisSpacing: 15,
      //             mainAxisSpacing: 20),
      //         itemCount: BlocProvider.of<PropertyTypeBloc>(context)
      //             .propertytypelist
      //             .length,
      //         itemBuilder: (context, index) {
      //           return _buildCateItem(
      //               BlocProvider.of<PropertyTypeBloc>(context)
      //                   .propertytypelist[index],
      //               index);
      //         },
      //       ),
      //     ),
      //   );
      // })

      appBar: AppBar(
        elevation: 0.4,
        toolbarHeight: size.height * 0.1,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        title: Text('CATEGORIES',
            style: TextStyle(
                fontFamily: 'btb',
                color: app_color,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
            textScaleFactor: 1),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              CategoryWidget(
                isshow: false,
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildCateItem(PropertyTypeModel propertyTypeModel, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (con) => ProperyList(
                      propertyTypeModel: propertyTypeModel,
                      isHorizontal: true,
                    )));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(flex: 1, child: Center()),
              Expanded(
                flex: 8,
                child: AspectRatio(
                  aspectRatio: 2 / 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: propertyTypeModel.img != null
                        ? ExtendedImage.network(
                            "${BlocProvider.of<PropertyTypeBloc>(context).propertytypelist[index].img}",

                            cacheWidth: 1000,
                            // cacheHeight: 400,
                            enableMemoryCache: true,
                            clearMemoryCacheWhenDispose: true,
                            clearMemoryCacheIfFailed: false,
                            fit: BoxFit.fill,
                            width: double.infinity,
                          )
                        : Image.asset(
                            "${imagesListUrl[index]}",
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
              ),
              Expanded(flex: 1, child: Center()),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            propertyTypeModel.name!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            textScaleFactor: 1.2,
          )
        ],
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      brightness: Brightness.light,
      elevation: 0,
      backgroundColor: Colors.red,
      leading: widget.isAll == true
          ? null
          : IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
      centerTitle: true,
      title: Text(
        "Category",
        style: TextStyle(
          color: Colors.white,
        ),
        textScaleFactor: 1.1,
      ),
    );
  }
}
