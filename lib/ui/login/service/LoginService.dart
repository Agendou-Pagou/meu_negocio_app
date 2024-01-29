import 'package:dio/dio.dart';
import 'package:meu_negocio_app/core/local/AppSecureStorage.dart';
import 'package:meu_negocio_app/core/log/Log.dart';
import 'package:meu_negocio_app/core/network/BaseApi.dart';
import 'package:meu_negocio_app/ui/login/model/LoginRequest.dart';
import 'package:meu_negocio_app/ui/login/model/LoginResponse.dart';

class LoginService {

  static Future<Response> login(LoginRequest loginRequest) async {
    Response response = await BaseApi.getInstance().post(
    '/v1/auth/login', <String, dynamic>{
      'email': loginRequest.email,
      'password' : loginRequest.password
    });


    await AppSecureStorage.getInstance().setAuthToken(LoginResponse.fromJsonString(response.toString()).authToken);
    await AppSecureStorage.getInstance().setRefreshToken(LoginResponse.fromJsonString(response.toString()).refreshToken);

    assert(loginRequest.email != null);

    AppSecureStorage.getInstance().setEmail(loginRequest.email ?? '');

    return response;
  }

  static Future<LoginRequest> refreshToken() async {

    Response response = await BaseApi.getInstance().post("/v1/auth/refresh", null);

    await AppSecureStorage.getInstance().setAuthToken(LoginResponse.fromJsonString(response.toString()).authToken);
    await AppSecureStorage.getInstance().setRefreshToken(LoginResponse.fromJsonString(response.toString()).refreshToken);

    return LoginRequest.fromJsonString(response.toString());
  }

}


