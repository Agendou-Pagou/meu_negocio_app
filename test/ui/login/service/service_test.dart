import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meu_negocio_app/core/log/Log.dart';
import 'package:meu_negocio_app/ui/login/model/LoginResponse.dart';
import 'package:test/test.dart';
import 'package:meu_negocio_app/ui/login/service/LoginService.dart';
import 'package:meu_negocio_app/ui/login/model/LoginRequest.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    FlutterSecureStorage.setMockInitialValues({});
  });

  test('LoginService login', () async {
    // Arrange
    final loginRequest = LoginRequest('saniman111@regapts.com', 'password123');

    int? statusCode;
    await LoginService.login(loginRequest)
      .then((value) {
        statusCode = value.statusCode;

        Log.d( "refreshToken: ${LoginResponse.fromJsonString(value.toString()).refreshToken}");
        Log.d( "authToken: ${LoginResponse.fromJsonString(value.toString()).authToken}");

      })
      .catchError((e) {
        Log.d('Error in API request: $e');

        statusCode = e.response?.statusCode;
          
      });

    // Assert
    expect(statusCode, isIn([200, 401]));
   });
}

