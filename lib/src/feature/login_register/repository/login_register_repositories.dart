import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:royal_landapp/src/feature/auth/model/user_model.dart';
import 'package:royal_landapp/src/utils/service/api_provider.dart';
import 'package:royal_landapp/src/utils/service/custome_exception.dart';

class LoginRegisterRepository {
  ApiProvider apiProvider = ApiProvider();
  String mainUrl = "http://loan.anakutjob.com/loan/anakut/public/api/";

  Future<UserModel> login(
      {required String phone, required String password}) async {
    String url = mainUrl + "login?vendor_code=asiaworld";
    Map body = {"email": phone, "password": password};

    var auth = 'Bearer' + base64Encode(utf8.encode('$phone:$password'));

    try {
      Response response = await apiProvider.post(
          url, body, Options(headers: <String, String>{'authorization': auth}));

      if (response.statusCode == 200 && response.data["code"] == 0) {
        return UserModel.fromJson(response.data);
      } else if (response.data["code"].toString() != "0") {
        throw response.data["message"];
      }
      throw CustomException.generalException();
    } catch (error) {
      throw error;
    }
  }

  Future<UserModel> register(
      {required String name,
      required String phoneNumber,
      required String email,
      required String password}) async {
    try {
      String url = mainUrl + "register?vendor_code=asiaworld";
      Map body = {
        "name": name,
        "phone": phoneNumber,
        "password": password,
        "email": email
      };

      Response response = await apiProvider.post(url, body, null);
      if (response.statusCode == 200 && response.data["code"] == 0) {
        return UserModel.fromJson(response.data);
      } else if (response.data["code"] != 0) {
        throw response.data["message"];
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }
}
