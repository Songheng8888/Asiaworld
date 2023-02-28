import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:royal_landapp/src/feature/shop/model/shop_model.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';
import 'package:royal_landapp/src/utils/service/custome_exception.dart';

class ShopReppsitory {
  ApiProvider apiProvider = ApiProvider();

  Future<List<ShopModel>> getShop(
      {required int page, required int rowperpage}) async {
    try {
      String url =
          "http://loan.anakutjob.com/loan/anakut/public/api/companies?row_per_page=$rowperpage&page=$page&vendor_code=loan";
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<ShopModel> companyRepo = [];
        response.data["data"].forEach((element) {
          companyRepo.add(ShopModel.fromJson(element));
        });

        return companyRepo;
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }
}
