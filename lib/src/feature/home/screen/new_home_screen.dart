import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/constants/app_constant.dart';
import 'package:royal_landapp/src/feature/account/favorite/favorite_screen.dart';
import 'package:royal_landapp/src/feature/banner/screen/baner_page.dart';
import 'package:royal_landapp/src/feature/categories/widget/categogy.dart';
import 'package:royal_landapp/src/feature/property/bloc/index.dart';
import 'package:royal_landapp/src/feature/property/repository/property_listing_repository.dart';
import 'package:royal_landapp/src/feature/propertytype/bloc/property_type_bloc.dart';
import 'package:royal_landapp/src/feature/propertytype/bloc/property_type_state.dart';
import 'package:royal_landapp/src/feature/search/screen/new_search.dart';
import 'package:royal_landapp/src/feature/search/screen/search.dart';
import 'home_property_by_cate.dart';

class HomeScreenNew extends StatefulWidget {
  const HomeScreenNew({Key? key}) : super(key: key);

  @override
  State<HomeScreenNew> createState() => _HomeScreenNewState();
}

class _HomeScreenNewState extends State<HomeScreenNew> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        toolbarHeight: size.height * 0.1,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark),
        title: Container(
          width: size.width,
          height: size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    width: 85,
                    height: 85,
                    child: Image(
                      image: AssetImage('assets/icon/app1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "ASIA WORLD",
                    style: TextStyle(
                        // letterSpacing: 1,
                        fontFamily: 'btb',
                        color: app_color,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              IconButton(
                icon: const Icon(Icons.search_outlined, color: Colors.red),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (Context) => SearchPage()));
                },
              ),
              IconButton(
                icon: const Icon(Icons.favorite_outline, color: Colors.red),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (Context) => FavoriteScreen()));
                },
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              // SizedBox(
              //   height: 16,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: BannerPage(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CategoryWidget(),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    BlocBuilder<PropertyTypeBloc, PropertyTypeState>(
                      builder: (context, dynamic state) {
                        if (state is FetchingPropertyType) {
                          return Container();
                        } else if (state is ErrorFetchingPropertyType) {
                          return Container(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else {
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                BlocProvider.of<PropertyTypeBloc>(context).propertytypelist.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => BlocProvider(
                              create: (BuildContext context) => PropertyListingBloc(
                                  productListingRepository: PropertyListByCateRepo(), rowPerPage: 3)
                                ..add(InitializeProductListingStarted(
                                    arg: BlocProvider.of<PropertyTypeBloc>(context)
                                        .propertytypelist[index]
                                        .id)),
                              child: HomePropertyListByCate(
                                propertyTypeModel: BlocProvider.of<PropertyTypeBloc>(context)
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
