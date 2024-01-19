import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meu_negocio_app/core/log/Log.dart';

class AppSecureStorage {


  static const String _NAME  = "name";
  static const String _EMAIL = "email";
  static const String _AUTH_TOKEN = "auth_token";
  static const String _REFRESH_TOKEN = "refresh_token";

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

   Future<void> setRefreshToken(String token) async {
      try {
        await storage.write(key: _REFRESH_TOKEN, value: token);
      } catch (e) {
        Log.e("Error while setting refresh refresh token: $e");
      }
    }

    Future<String?> getRefreshToken() async {
      try {
        return await storage.read(key: _REFRESH_TOKEN);
      } catch (e) {
        Log.e("Error while getting refresh refresh token: $e");
        return null;
      }
    }


   Future<void> setAuthToken(String token) async {
      try {
        await storage.write(key: _AUTH_TOKEN, value: token);
      } catch (e) {
        Log.e("Error while setting refresh auth token: $e");
      }
    }

    Future<String?> getAuthToken() async {
      try {
        return await storage.read(key: _AUTH_TOKEN);
      } catch (e) {
        Log.e("Error while getting refresh auth token: $e");
        return null;
      }
    }


   Future<void> setEmail(String email) async {
      try {
        await storage.write(key: _EMAIL, value: email);
      } catch (e) {
        Log.e("Error while setting email: $e");
      }
    }

    Future<String?> getEmail() async {
      try {
        return await storage.read(key: _EMAIL);
      } catch (e) {
        Log.e("Error while getting email: $e");
        return null;
      }
    }


   Future<void> setName(String name) async {
      try {
        await storage.write(key: _NAME, value: name);
      } catch (e) {
        Log.e("Error while setting name: $e");
      }
    }

    Future<String?> getName() async {
      try {
        return await storage.read(key: _NAME);
      } catch (e) {
        Log.e("Error while getting name: $e");
        return null;
      }
    }


    Future<void> clear() async {
      storage.deleteAll();
    }
}

