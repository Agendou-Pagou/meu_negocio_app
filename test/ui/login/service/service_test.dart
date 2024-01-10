import 'package:test/test.dart';
import 'package:meu_negocio_app/ui/login/service/LoginService.dart';
import 'package:meu_negocio_app/ui/login/model/LoginRequest.dart';
import 'package:dio/dio.dart'; // Import Dio package

void main() {
  test('LoginService login', () async {
    // Arrange
    final loginRequest = LoginRequest(email: 'test@example.com', password: 'password123');

    int? statusCode;
    await LoginService.login(loginRequest)
      .then((value) {
        statusCode = value.statusCode;
      })
      .catchError((e) {
        if (e is DioException) 
          statusCode = e.response?.statusCode;
          
      });

    // Assert
    expect(statusCode, 401);
  });
}

