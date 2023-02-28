import 'package:dio/dio.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';
import 'package:royal_landapp/src/utils/service/custome_exception.dart';

class VerifyOptRepository {
  ApiProvider apiProvider = ApiProvider();
  String mainUrl = "http://loan.anakutjob.com/loan/anakut/public/api/";

  Future<void> verifyOpt({
    required dynamic ref,
    required dynamic text,
  }) async {
    try {
      String url = mainUrl + "verification/confirm";
      Map body = {
        "reference_no": ref,
        "verified_text": text,
      };

      Response response = await apiProvider.post(url, body, null);
      if (response.statusCode == 200 && response.data["code"] == 0) {
        return;
      } else if (response.data["code"].toString() != "0") {
        throw response.data["message"];
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }

  Future<String> resendOtp({dynamic token}) async {
    try {
      String url = mainUrl + "verification/resend";

      Response response = await apiProvider.post(url, null, null);
      if (response.statusCode == 200) {
        return response.data["data"]["reference_no"].toString();
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }
}
