import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  LocalStorage._privateConstructor();

  static const token = 'access_token';

  final _storage = const FlutterSecureStorage();
  static final LocalStorage instance = LocalStorage._privateConstructor();

  Future writeToken(String value) async {
    await _storage.write(key: token, value: value);
  }

  Future readToken() async {
    return _storage.read(key: token);
  }
}
