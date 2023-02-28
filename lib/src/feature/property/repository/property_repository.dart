import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:royal_landapp/src/feature/property/model/property_model.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';
import 'package:royal_landapp/src/utils/service/custome_exception.dart';

class PropertyRepository {
  ApiProvider apiProvider = ApiProvider();
  String mainUrl = "http://loan.anakutjob.com/loan/anakut/public/api/";
  Future<List<PropertyModel>> getPropertyList(
      {required int page, required int rowperpage}) async {
    try {
      String url = mainUrl +
          "items?row_per_page=$rowperpage&page=$page&vendor_code=asiaworld";
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<PropertyModel> categoryModel = [];
        response.data["data"].forEach((data) {
          categoryModel.add(PropertyModel.fromJson(data));
        });
        return categoryModel;
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }

  Future<List<PropertyModel>> getRelatedPropertyList(
      {required String id, required int page, required int rowperpage}) async {
    try {
      String url = mainUrl +
          "items?row_per_page=$rowperpage&page=$page&related_id=$id &vendor_code=asiaworld";
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<PropertyModel> categoryModel = [];
        response.data["data"].forEach((data) {
          categoryModel.add(PropertyModel.fromJson(data));
        });
        return categoryModel;
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }

  Future<List<PropertyModel>> getPropertyById(
      {required String id, required int page, required int rowperpage}) async {
    try {
      String url = mainUrl +
          "items?row_per_page=$rowperpage&page=$page&type_id=$id&vendor_code=asiaworld";
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<PropertyModel> categoryModel = [];
        response.data["data"].forEach((data) {
          categoryModel.add(PropertyModel.fromJson(data));
        });
        return categoryModel;
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }
}
