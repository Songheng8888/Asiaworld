import 'package:dio/dio.dart';
import 'package:royal_landapp/src/feature/blog/model/blog_model.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:royal_landapp/src/utils/service/custome_exception.dart';

List<BlogModel> parseBlogs(responseBody) {

  return responseBody
      .map<BlogModel>((json) => BlogModel.fromJson(json))
      .toList();
}

abstract class BlogListingRepository {
  final ApiProvider apiProvider = ApiProvider();
  final String baseUrl = "http://opentech.anakutjobs.com/anakut/public/api";
  Future<List<BlogModel>> getBlogList(
      {@required int page, @required int rowPerPage, @required additionalArg});
  Future<List<BlogModel>> operate(
      {@required String? urlSuffix,
      @required int? page,
      @required int? rowPerPage}) async {
    try {
     
      String url = baseUrl + urlSuffix!;
      Response response = (await apiProvider.get(url, null, null));
      print(url);

      if (response.statusCode == 200) {
   
        List<BlogModel> blogs = [];
        response.data["data"].forEach((val) {
          blogs.add(BlogModel.fromJson(val));
        });
        return blogs;
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }
}

class BlogListRepo extends BlogListingRepository {
  @override
  Future<List<BlogModel>> getBlogList(
          {@required int? page,
          @required int? rowPerPage,
          @required additionalArg}) async =>
      await super.operate(
          urlSuffix: "/blogs?row_per_page=$rowPerPage&page=$page",
          page: page,
          rowPerPage: rowPerPage);
}

class BlogListByCategoryRepo extends BlogListingRepository {
  @override
  Future<List<BlogModel>> getBlogList(
      {@required int? page,
      @required int? rowPerPage,
      @required additionalArg}) async {
    if (additionalArg is String)
      return await super.operate(
          urlSuffix:
              "/blogs?category_id=$additionalArg&row_per_page=$rowPerPage&page=$page",
          page: page,
          rowPerPage: rowPerPage);
    else
      throw CustomException(message: "Invalid argument.");
  }
}

