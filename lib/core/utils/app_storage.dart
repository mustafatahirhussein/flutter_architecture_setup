import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorage {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  final String tokenKey = 'tokenKey';

  Future<String?> getToken() async {
    return await secureStorage.read(key: tokenKey);
  }

  Future<void> saveToken(String value) async {
    return await secureStorage.write(key: tokenKey, value: value);
  }
}