
import 'package:dio/dio.dart';
import 'package:royal_landapp/src/feature/notification/model/notification_model.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';
import 'package:royal_landapp/src/utils/service/custome_exception.dart';

class NotificationRepository {
  ApiProvider _apiProvider = ApiProvider();
  Future<List<NotificationModel>> getnotification(
      {required int rowperpage, required int page}) async {
    try {
      String url =
          "http://loan.anakutjob.com/loan/anakut/public/api/notifications?row_per_page=$rowperpage&page=$page&vendor_code=asiaworld";
      Response response = await _apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<NotificationModel> notificationModel = [];
        response.data["data"].forEach((element) {
          notificationModel.add(NotificationModel.fromJson(element));
        });

        return notificationModel;
      }
      throw CustomException();
    } catch (e) {
      throw e;
    }
  }
}
