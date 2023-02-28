import 'package:dio/dio.dart';
import 'package:royal_landapp/src/feature/banner/model/model_banner.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';

class BannerRepository {
  ApiProvider _apiProvider = ApiProvider();
  Future<List<BannerModel>> getListBanner() async {
    try {
      String url = "http://loan.anakutjob.com/loan/anakut/public/api/banners";
      Response response = await _apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<BannerModel> banner = [];
        response.data["data"].forEach((data) {
          banner.add(BannerModel.fromJson(data));
        });
        return banner;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw e;
    }
  }
}
