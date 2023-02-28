import 'package:dio/dio.dart';
import 'package:royal_landapp/src/feature/property/model/property_model.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';
import 'package:royal_landapp/src/utils/service/custome_exception.dart';

abstract class PropertyListingRepository {
  final ApiProvider apiProvider = ApiProvider();
  final String baseUrl = "http://loan.anakutjob.com/loan/anakut/public/api";
  String url = "";
  Future<List<PropertyModel>> getPropertyList(
      {required int page, required additionalArg});

  Future<List<PropertyModel>> operate({
    required String urlSuffix,
    required int page,
  }) async {
    try {
      url = baseUrl + urlSuffix;
      Response response = await apiProvider.get(url, null, null);

      if (response.statusCode == 200) {
        List<PropertyModel> products = [];
        response.data["data"].forEach((val) {
          products.add(PropertyModel.fromJson(val));
        });
        return products;
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }
}

class PropertyListRepo extends PropertyListingRepository {
  @override
  Future<List<PropertyModel>> getPropertyList(
          {required int page, required additionalArg}) async =>
      await super.operate(
          urlSuffix: "/items?row_per_page=12&page=$page&vendor_code=asiaworld",
          page: page);
}

class PropertyListByCateRepo extends PropertyListingRepository {
  @override
  Future<List<PropertyModel>> getPropertyList(
          {required int page, required additionalArg}) async =>
      await super.operate(
          urlSuffix:
              "/items?row_per_page=12&page=$page&type_id=$additionalArg&vendor_code=asiaworld",
          page: page);
}
