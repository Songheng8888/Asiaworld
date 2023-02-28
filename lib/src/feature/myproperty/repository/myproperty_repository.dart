import 'package:dio/dio.dart';
import 'package:royal_landapp/src/feature/property/model/property_model.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';
import 'package:royal_landapp/src/utils/service/custome_exception.dart';

class MyPropertyRepository {
  ApiProvider _apiProvider = ApiProvider();
  String mailUrl = "http://loan.anakutjob.com/loan/anakut/public/api/";
  Future<List<PropertyModel>> getMyProperties(
      {required int page, required int rowperpage}) async {
    try {
      Future.delayed(Duration(milliseconds: 200));
      String url = mailUrl + "items/auth?row_per_page=$rowperpage&page=$page";
      Response response = await _apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        print(response.data);
        List<PropertyModel> categoryModel = [];
        response.data["data"].forEach((data) {
          categoryModel.add(PropertyModel.fromJson(data));
        });
        return categoryModel;
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<void> addMyproperty({
    required String propertyName,
    required String propertyType,
    required String projectId,
    required String marketId,
    required String propertyCode,
    required String propertyPrice,
    required String propertyNo,
    required String address,
    required String street,
    required String lat,
    required String long,
    required String village,
    required String commune,
    required String district,
    required String province,
    required String img,
  }) async {
    try {
      final String url = mailUrl + "items/add";
      Map body = {
        "property_name": propertyName,
        "item_type": propertyType,
        "project_id": projectId,
        "market_type_id": marketId,
        "property_code": propertyCode,
        "property_price": propertyPrice,
        "property_no": propertyNo,
        "address_number": address,
        "address_street": street,
        "lat": lat,
        "lon": long,
        "village": village,
        "commune": commune,
        "district": district,
        "province": province,
        "image": img,
        "photos": [
          {"image": ""},
          {"image": ""}
        ]
      };
      print(lat);
      print(long);
      print(url);
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

  Future<void> editMyproperty({
    required String id,
    required String propertyName,
    required String propertyType,
    required String projectId,
    required String marketId,
    required String propertyCode,
    required String propertyPrice,
    required String propertyNo,
    required String address,
    required String street,
    required String lat,
    required String long,
    required String village,
    required String commune,
    required String district,
    required String province,
    String? img,
  }) async {
    try {
      final String url = mailUrl + "items/edit/$id";
      Map body = {};
      print(img);
      print(img);
      body = {
        "property_name": propertyName,
        "item_type": propertyType,
        "project_id": projectId,
        "market_type_id": marketId,
        "property_code": propertyCode,
        "property_price": propertyPrice,
        "property_no": propertyNo,
        "address_number": address,
        "address_street": street,
        "lat": lat,
        "lon": long,
        "village": village,
        "commune": commune,
        "district": district,
        "province": province,
        "image": img,
        "photos": [
          {"image": ""},
          {"image": ""}
        ]
      };
      print(propertyType);
      print(body);

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

  Future<void> deleteMyProperty({required String id}) async {
    try {
      final String url = mailUrl + "items/delete/$id";
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
