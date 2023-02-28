import 'package:dio/dio.dart';
import 'package:royal_landapp/src/feature/account/model/acc_model.dart';

import 'package:royal_landapp/src/utils/service/api_provider.dart';
import 'package:royal_landapp/src/utils/service/custome_exception.dart';

class AccountRepository {
  int rowPerPage = 10;
  String mainUrl = "http://loan.anakutjob.com/loan/anakut/public/api/";
  ApiProvider apiProvider = ApiProvider();
  Future<AccountModel> getAccount() async {
    try {
      String url = mainUrl + "profile";

      Response response = await apiProvider.get(url, null, null);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        //  print(json.decode(response.body));
        return AccountModel.fromJson(response.data["data"]);
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateAccount(
      {required String name,
      required String phone,
      required String email,
      required String city,
      required String company,
      required String address,
      required String skills,
      required String educations,
      required String experiences,
      // required String subscriptionId,
      // required String paymentMethod,
      String? imageUrl}) async {
    try {
      String url = mainUrl + "profile/update";
      Map body = {
        // "type": "company",
        "name": name,
        "phone": phone,
        "email": email,
        "city": city,
        "company": company,
        "address": address,
        "skills": skills,
        "educations": educations,
        "experiences": experiences,
        "image_url": imageUrl,
      };
      print(imageUrl);
      print(address);

      Response response = await apiProvider.put(url, body);
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

  Future<void> upgradeAccount(
      {required String subscriptionId,
      required String paymentMethod,
      required String imageUrl}) async {
    try {
      String url = mainUrl + "upgrade";
      Map body = {
        "type": "company",
        "subscription_plan_id": subscriptionId,
        "payment_type": "transfer",
        "payment_method": paymentMethod,
        "image_url": imageUrl,
      };
      print(imageUrl);
      print(url);
      Response response = await apiProvider.post(url, body, null);
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
}
