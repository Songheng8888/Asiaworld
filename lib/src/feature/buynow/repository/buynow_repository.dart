import 'package:dio/dio.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';

class BuyNowRepository {
  ApiProvider _apiProvider = ApiProvider();

  Future<void> buynow({required int property_id}) async {
    String url = "http://loan.anakutjob.com/loan/anakut/public/api/sales/add";

    Map body = {
      "sale_type": "buy_now",
      "property_id": property_id,
      "remark": "Testing"
    };

    try {
      Response response = await _apiProvider.post(url, body, null);
      if (response.statusCode == 200 || response.data['code'] == 0) {
        print(response.data['message']);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
