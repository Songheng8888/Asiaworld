import 'package:dio/dio.dart';
import 'package:royal_landapp/src/feature/wanted/model/wanted_model.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';
import 'package:royal_landapp/src/utils/service/custome_exception.dart';

class WantedRepository {
  ApiProvider _apiProvider = ApiProvider();
  String mailUrl = "http://loan.anakutjob.com/loan/anakut/public/api/";
  Future<List<WantedModel>> getWantedList({required int page}) async {
    try {
      Future.delayed(Duration(milliseconds: 200));
      String url =
          mailUrl + "wanted?row_per_page=12&page=$page&vendor_code=asiaworld";
      Response response = await _apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<WantedModel> categoryModel = [];
        response.data["data"].forEach((data) {
          categoryModel.add(WantedModel.fromJson(data));
        });
        return categoryModel;
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }

  Future<List<WantedModel>> getMyWantedList({required int page}) async {
    try {
      Future.delayed(Duration(milliseconds: 200));
      String url = mailUrl +
          "wanted/auth?row_per_page=12&page=$page&vendor_code=asiaworld";
      Response response = await _apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<WantedModel> categoryModel = [];
        response.data["data"].forEach((data) {
          categoryModel.add(WantedModel.fromJson(data));
        });
        return categoryModel;
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }

  Future<void> addWanted({
    required String description,
    required String propertyTypeId,
    required String minPrice,
    required String maxPrice,
    required String contactNumber,
    required String marketTypeId,
  }) async {
    try {
      final String url = mailUrl + "wanted/add";
      Map body = {
        "description": description,
        "item_type_id": propertyTypeId,
        "min_price": minPrice,
        "max_price": maxPrice,
        "contact_number": contactNumber,
        "market_type_id": marketTypeId,
      };
      Response response = await _apiProvider.post(url, body, null);
      print(response.statusCode);
      if (response.statusCode == 200 && response.data["code"] == 0) {
        print(response.data);
        return;
      } else if (response.data["code"].toString() != "0") {
        throw response.data["message"];
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }

  Future<void> editWanted({
    required String id,
    required String description,
    required String propertyTypeId,
    required String minPrice,
    required String maxPrice,
    required String contactNumber,
    required String marketTypeId,
  }) async {
    try {
      final String url = mailUrl + "wanted/edit/$id";
      Map body = {
        "description": description,
        "item_type_id": propertyTypeId,
        "min_price": minPrice,
        "max_price": maxPrice,
        "contact_number": contactNumber,
        "market_type_id": marketTypeId,
      };

      Response response = await _apiProvider.put(url, body);
      if (response.statusCode == 200 && response.data["code"] == 0) {
        print(response.data);
        return;
      } else if (response.data["code"].toString() != "0") {
        throw response.data["message"];
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }

  Future<void> deleteWanted({required String id}) async {
    try {
      final String url = mailUrl + "wanted/delete/$id";
      Response response = await _apiProvider.delete(url, null);
      if (response.statusCode == 200 && response.data["code"] == 0) {
        print(response.data);
        return;
      } else if (response.data["code"].toString() != "0") {
        throw response.data["message"];
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }
}
