import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class AppSecureStorage {

  static AppSecureStorage? _singleton;

  FlutterSecureStorage storage;

  AppSecureStorage._internal() :
    storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true
      )
    );

  factory AppSecureStorage.getInstance() => 
    _singleton ??= AppSecureStorage._internal();

   Future<void> setToken(String token) async {
      try {
        await storage.write(key: "token", value: token);
      } catch (e) {
        Logger().e("Error while setting token: $e");
      }
    }

    Future<String?> getToken() async {
      try {
        return await storage.read(key: "token");
      } catch (e) {
        Logger().e("Error while getting token: $e");
        return null;
      }
    }
}

