import 'package:extended_image/extended_image.dart';
import 'package:flutter/widgets.dart';
import 'package:royal_landapp/src/feature/property/screen/property_by_id.dart';
import 'package:royal_landapp/src/feature/property/screen/property_list.dart';
import 'package:royal_landapp/src/feature/propertytype/model/propertytype_model.dart';
import 'package:flutter/material.dart';

Widget typeItem(
    BuildContext context, PropertyTypeModel propertyTypeModel, String img) {
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
    child: Container(
        height: 150,
        decoration: BoxDecoration(),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      // color: Colors.grey[350],
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: propertyTypeModel.img != null
                              ? ExtendedImage.network(
                                  "${propertyTypeModel.img}",

                                  cacheWidth: 1000,
                                  // cacheHeight: 400,
                                  enableMemoryCache: true,
                                  clearMemoryCacheWhenDispose: true,
                                  clearMemoryCacheIfFailed: false,
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                )
                              : CircleAvatar(
                                  backgroundImage: AssetImage("$img"),
                                  radius: 50.0,
                                )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Text(
                        "${propertyTypeModel.name}",
                        textScaleFactor: 1.4,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
  );
}
