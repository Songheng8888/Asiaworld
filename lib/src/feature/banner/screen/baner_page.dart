import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:royal_landapp/src/feature/banner/bloc/banner_state.dart';
import 'package:royal_landapp/src/feature/banner/bloc/index.dart';
import 'package:royal_landapp/src/feature/banner/model/model_banner.dart';
import 'package:royal_landapp/src/shared/bloc/indexing/indexing_bloc.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  _BannerPageState createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  List<BannerModel> bannerModel = [];
  BannerBloc _bannerBloc = BannerBloc();
  IndexingBloc indexingBloc = IndexingBloc();
  List<String> image = [
    'assets/images/asia world-01.png',
    'assets/images/asia world-01.png',
  ];
  @override
  void initState() {
    _bannerBloc.add(FetchedBannerStarted());
    super.initState();
  }

  @override
  void dispose() {
    _bannerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bannerBloc,
        builder: (context, state) {
          print(state);
          if (state is FetchingBanner) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ErrorFetchingBanner) {
            return Center(
              child: TextButton(
                onPressed: () {
                  _bannerBloc.add(FetchedBannerStarted());
                },
                child: Text("Retry"),
              ),
            );
          } else {
            print("banner ${_bannerBloc.banners.length}");
            if (_bannerBloc.banners.length == 0) {
              return Stack(
                children: [
                  CarouselSlider(
                      items: image
                          .map(
                            (e) => Container(
                              padding: EdgeInsets.only(
                                top: 5,
                              ),
                              width: 600,
                              child: Container(
                                width: 500,
                                height: 240,
                                // height: 230,
                                child: ClipRRect(
                                  child: Container(
                                    color: Colors.grey[350],
                                    child: ExtendedImage.network(
                                      e,

                                      cacheWidth: 1000,
                                      // cacheHeight: 400,
                                      enableMemoryCache: true,
                                      clearMemoryCacheWhenDispose: true,
                                      clearMemoryCacheIfFailed: false,
                                      fit: BoxFit.fill,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                        onPageChanged: (index, s) {},
                        aspectRatio: 2.1,
                        // aspectRatio: 2,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 600),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        scrollDirection: Axis.horizontal,
                      )),
                ],
              );
            }

            return Stack(
              children: [
                CarouselSlider(
                    items: _bannerBloc.banners
                        .map(
                          (e) => Container(
                            padding: EdgeInsets.only(
                              top: 5,
                            ),
                            width: 600,
                            child: Container(
                              width: 500,
                              height: 240,
                              child: ClipRRect(
                                child: Container(
                                  color: Colors.grey[350],
                                  child: ExtendedImage.network(
                                    e.image,
                                    cacheWidth: 1000,
                                    enableMemoryCache: true,
                                    clearMemoryCacheWhenDispose: true,
                                    clearMemoryCacheIfFailed: false,
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      onPageChanged: (index, s) {},
                      aspectRatio: 2.1,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 600),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      scrollDirection: Axis.horizontal,
                    )),
              ],
            );
          }
        });
  }
}
