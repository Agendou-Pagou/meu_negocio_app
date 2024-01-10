import 'dart:math';

import 'package:logger/logger.dart';
import 'package:meu_negocio_app/core/log/Log.dart';
import 'package:meu_negocio_app/ui/register/model/RegisterRequest.dart';
import 'package:meu_negocio_app/ui/register/service/RegisterService.dart';
import 'package:test/test.dart';
import 'package:dio/dio.dart'; // Import Dio package

void main() {


  test('RegisterService', () async {
    // Arrange
    final registerRequest = RegisterRequest('random2@gmail.com','123','password123');

    int? statusCode;
    await RegisterService.register(registerRequest)
      .then((value) {
        statusCode = value.statusCode;
      })
      .catchError((e) {
        if (e is DioException){
          Log.e(e.response?.statusCode);
          statusCode = e.response?.statusCode;

          }
      });

    // Assert
      expect(statusCode, isIn([409, 200]));
  });
}

