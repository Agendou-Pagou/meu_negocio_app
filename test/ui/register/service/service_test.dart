import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meu_negocio_app/core/log/Log.dart';
import 'package:meu_negocio_app/ui/register/model/RegisterRequest.dart';
import 'package:meu_negocio_app/ui/register/service/RegisterService.dart';
import 'package:test/test.dart';
import 'package:dio/dio.dart'; // Import Dio package

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    FlutterSecureStorage.setMockInitialValues({});
  });

  test('RegisterService', () async {
    // Arrange
    final registerRequest = RegisterRequest('saniman111@regapts.com','123','password123');

    int? statusCode;
    await RegisterService.register(registerRequest)
      .then((value) {
        statusCode = value.statusCode;

        Log.d(value);
      })
      .catchError((e) {
        if (e is DioException){
          Log.d('Error in API request: $e');
          statusCode = e.response?.statusCode;

          }
      });

    // Assert
      expect(statusCode, isIn([409, 200]));
  });
}

