import 'package:dio/dio.dart';
import 'package:royal_landapp/src/feature/subscription/model/subscription_model.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';
import 'package:royal_landapp/src/utils/service/custome_exception.dart';

class SubscriptionRepository {
  ApiProvider apiProvider = ApiProvider();
  Future<List<SubScriptionModel>> getListSubscription() async {
    try {
      String url =
          "http://loan.anakutjob.com/loan/anakut/public/api/subscription/plans";
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<SubScriptionModel> list = [];
        response.data["data"].forEach((data) {
          list.add(SubScriptionModel.fromJson(data));
        });
        return list;
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }
}
