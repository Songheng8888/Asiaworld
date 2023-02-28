import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_landapp/src/constants/app_constant.dart';
import 'package:royal_landapp/src/feature/propertytype/bloc/index.dart';

class CategoryWidget extends StatefulWidget {
  // const CategoryWidget({Key? key}) : super(key: key);
  final bool isshow;
  CategoryWidget({this.isshow = true});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
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
    return BlocBuilder<PropertyTypeBloc, PropertyTypeState>(
        builder: (context, state) {
      if (state is FetchingPropertyType) {
        return widget.isshow
            ? Center()
            : Center(
                child: CircularProgressIndicator(),
              );
      }
      if (state is ErrorFetchingPropertyType) {
        return Center(
          child: Text(state.error.toString()),
        );
      }
      return Container(
        child: Column(
          children: <Widget>[
            widget.isshow
                ? Container(
                    width: size.width * 0.95,
                    child: Text("CATEGORIES",
                        style: TextStyle(
                            fontFamily: 'btb',
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                        textScaleFactor: 1.1),
                  )
                : Container(),
            SizedBox(
              height: 20,
            ),
            Container(
              width: size.width * 0.95,
              height: 100,
              child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: BlocProvider.of<PropertyTypeBloc>(context)
                      .propertytypelist
                      .length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: grey.withOpacity(0.08),
                      ),
                      margin: EdgeInsets.only(right: 8),
                      child: Column(
                        children: <Widget>[
                          // Image(image: Net)
                          Container(
                            width: 60,
                            height: 60,
                            padding: EdgeInsets.all(12),
                            child: ImageIcon(
                              AssetImage(image[index]),
                              size: 40,
                              color: app_color,
                            ),
                          ),
                          Text(
                            BlocProvider.of<PropertyTypeBloc>(context)
                                .propertytypelist[index]
                                .name!
                                .toUpperCase(),
                            style: TextStyle(
                                fontFamily: 'btb', fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}
