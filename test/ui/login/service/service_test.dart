import 'package:meu_negocio_app/core/log/Log.dart';
import 'package:meu_negocio_app/ui/login/model/LoginResponse.dart';
import 'package:test/test.dart';
import 'package:meu_negocio_app/ui/login/service/LoginService.dart';
import 'package:meu_negocio_app/ui/login/model/LoginRequest.dart';
import 'package:dio/dio.dart'; // Import Dio package

void main() {
  test('LoginService login', () async {
    // Arrange
    final loginRequest = LoginRequest('saniman111@regapts.com', 'password123');

    int? statusCode;
    await LoginService.login(loginRequest)
      .then((value) {
        statusCode = value.statusCode;

        Log.d( "token: "+ LoginResponse.fromJsonString(value.toString()).token);

      })
      .catchError((e) {
        if (e is DioException)
          Log.d('Error in API request: $e');
          statusCode = e.response?.statusCode;
          
      });

    // Assert
    expect(statusCode, isIn([200, 401]));
   });
}

