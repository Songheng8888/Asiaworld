import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:royal_landapp/src/utils/service/custome_exception.dart';

enum Method { Post, Get, Delete, Put }

class ApiProvider {
  static String accessToken = '';
  Dio _dio = Dio();

  Future<Response> post(String url, dynamic body, Options? options) async {
    return _httpServices(
        method: Method.Post, url: url, body: body, options: options);
  }

  Future<Response> get(String url, dynamic body, Options? options) async {
    return _httpServices(
        method: Method.Get, url: url, body: null, options: options);
  }

  Future<Response> put(String url, dynamic body) async {
    return _httpServices(method: Method.Put, url: url, body: body);
  }

  Future<Response> delete(String url, dynamic body) async {
    return _httpServices(method: Method.Delete, url: url, body: body);
  }

  Future<Response> _httpServices(
      {required Method method,
      required String url,
      dynamic body,
      Options? options}) async {
    Response response;
    try {
      _dio.options.headers["authorization"] = "Bearer " + accessToken;
      _dio.options.headers["secret"] = "anakut";
      _dio.options.headers["type"] = "upload";
      response = await ((method == Method.Post)
          ? _dio.post(url, data: body)
          : (method == Method.Get)
              ? _dio.get(url, options: options)
              : (method == Method.Put)
                  ? _dio.put(url, data: body)
                  : _dio.delete(url, data: body));
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
          if (e.response!.statusCode == 401) {
            throw 401;
          } else {
            if (e.response!.data["message"] == null) {
              throw e.message;
            } else {
              throw "${e.message}: ${e.response!.data["message"]}";
            }
            // throw e.message;
          }
        // return e.response!;
      }
      throw Exception("No Internet connection.");
    }
    return response;
  }
}

Future<String> uploadImage({required File image}) async {
  try {
    ApiProvider apiProvider = ApiProvider();
    String fileName = image.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(image.path, filename: fileName),
    });
    // var secretkey = "anakut";
    // var type = "upload";

    Response response = await apiProvider.post(
        "http://loan.anakutjob.com/loan/upload.php", formData, null);
    print(response.statusCode);

    if (response.statusCode == 200 && response.data["code"] == "0") {
      print(response.data);
      return response.data["image_url"];
    } else if (response.data["code"].toString() != "0") {
      throw response.data["message"];
    }
    throw CustomException.generalException();
  } catch (e) {
    throw e;
  }
}
