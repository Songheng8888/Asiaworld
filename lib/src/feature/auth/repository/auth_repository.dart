import 'package:royal_landapp/src/feature/auth/model/user_model.dart';
import 'package:royal_landapp/src/utils/service/storage.dart';

class AuthenticationRepository {
  Storage _storage = Storage();
  Future<void> saveToken({required String token}) async {
    await _storage.saveToken(token: token);
  }

  Future<String?> getToken() async {
    return await _storage.getToken();
  }

  Future<void> removeToken() async {
    return await _storage.removeToken();
  }
}
