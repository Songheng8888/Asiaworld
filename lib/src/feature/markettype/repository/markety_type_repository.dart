import 'package:dio/dio.dart';
import 'package:royal_landapp/src/feature/markettype/model/markettyp_model.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';
import 'package:royal_landapp/src/utils/service/custome_exception.dart';

class MarketTypeRepository {
  ApiProvider _apiProvider = ApiProvider();
  String mailUrl = "http://loan.anakutjob.com/loan/anakut/public/api/";
  Future<List<MarketTypeModel>> getMarketType() async {
    try {
      Future.delayed(Duration(milliseconds: 200));
      String url = mailUrl + "market_types";
      Response response = await _apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<MarketTypeModel> categoryModel = [];
        response.data["data"].forEach((data) {
          categoryModel.add(MarketTypeModel.fromJson(data));
        });
        return categoryModel;
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }
}
