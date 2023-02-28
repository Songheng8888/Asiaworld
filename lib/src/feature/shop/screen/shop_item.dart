import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:royal_landapp/src/feature/shop/model/shop_model.dart';
import 'package:royal_landapp/src/feature/shop/screen/shop_profile.dart';

class ShopItem extends StatefulWidget {
  final List<ShopModel> companyModel;
  const ShopItem({required this.companyModel});

  @override
  State<ShopItem> createState() => _ShopItemState();
}

class _ShopItemState extends State<ShopItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.builder(
        cacheExtent: 1000,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        // padding: EdgeInsets.only(left: 10, top: 10, right: 0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 4 / 4.2,
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 20),
        itemCount: widget.companyModel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShopProflie()));
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
                        aspectRatio: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          // child: ExtendedImage.network(
                          //   "${widget.companyModel[index].image!}",
                          //   cacheWidth: 1000,
                          //   enableMemoryCache: true,
                          //   clearMemoryCacheWhenDispose: true,
                          //   clearMemoryCacheIfFailed: false,
                          //   fit: BoxFit.fill,
                          //   width: double.infinity,
                          // ),
                          child: FadeInImage.assetNetwork(
                            placeholder: "assets/icon/app1.png",
                            image: widget.companyModel[index].image!,
                            imageErrorBuilder: (context, error, stackTrace) {
                              return InkWell(
                                onTap: (){},
                                child: Image.asset("assets/icon/app1.png"),
                              );
                            }),
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
                  "${widget.companyModel[index].name}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: 0.8,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
