import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:royal_landapp/src/constants/app_constant.dart';
import 'package:royal_landapp/src/feature/banner/screen/baner_page.dart';
import 'package:royal_landapp/src/feature/home/screen/app_bar.dart';
import 'package:royal_landapp/src/feature/shop/screen/shop_list.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        toolbarHeight: size.height * 0.1,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        title: Container(
          // padding: EdgeInsets.only(left: 10, right: 10),
          width: size.width,
          height: size.height * 0.1,
          child: Row(
            children: <Widget>[
              Container(
                width: 65,
                height: 65,
                child: Image(image: AssetImage('assets/icon/app.png')),
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
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.search,
                    color: app_color,
                  ),
                ),
              )
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: BannerPage(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                //  margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    // SizedBox(height: 15),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 10, right: 0),
                      //alignment: Alignment.centerLeft,
                      child: Text("All Shops",
                          textScaleFactor: 1.1,
                          style: TextStyle(
                              letterSpacing: 1,
                              color:
                                  Theme.of(context).textTheme.headline1!.color,
                              fontWeight: FontWeight.w500)),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    ShopList()
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
