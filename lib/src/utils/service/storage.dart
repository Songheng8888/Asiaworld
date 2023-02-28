import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:royal_landapp/src/feature/auth/model/user_model.dart';

class Storage {
  final storage = FlutterSecureStorage();
  Future<void> saveToken({required String token}) async {
    await storage.deleteAll();

    await storage.write(key: 'token', value: token);
  }

  static List<String> convertStringtoListString({required String data}) {
    return json.decode(data);
  }

  Future<String?> getToken() async {
    String? token = await storage.read(key: 'token');

    if (token != null) {
      return token;
    } else
      return null;
  }

  Future<void> removeToken() async {
    await storage.deleteAll();
    print("delete all token");
    return;
  }

  Future<void> saveSearchHistory({required String history}) async {
    await storage.write(key: "searchHistory", value: history);
    return;
  }

  Future<String?> getSearchHistory() async {
    return await storage.read(key: 'searchHistory');
  }

  Future<void> saveCurrentUser({required UserModel user}) async {
    await storage.deleteAll();

    await storage.write(key: "id", value: user.id);
    await storage.write(key: "token", value: user.token);
    await storage.write(key: "email", value: user.email);
    await storage.write(key: "verified_status", value: user.verifyStatus);
    await storage.write(key: "ref", value: user.ref);
    print(user.verifyStatus);
    print(user.token);
    return;
  }

  Future<UserModel?> getCurrentUser() async {
    String? _id = await storage.read(key: "id");
    String? _token = await storage.read(key: "token");
    String? _verify = await storage.read(key: "email");
    String? _email = await storage.read(key: "verified_status");
    String? _ref = await storage.read(key: "ref");
    if ((_id != null) && _token != null) {
      return UserModel(
          id: _id,
          email: _email,
          token: _token,
          verifyStatus: _verify,
          ref: _ref);
    } else {
      return null;
    }
  }
}
