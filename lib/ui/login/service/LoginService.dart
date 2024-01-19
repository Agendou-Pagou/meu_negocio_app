import 'package:local_auth/local_auth.dart';
import 'package:dio/dio.dart';
import 'package:meu_negocio_app/core/local/AppSecureStorage.dart';
import 'package:meu_negocio_app/core/network/BaseApi.dart';
import 'package:meu_negocio_app/ui/login/model/LoginRequest.dart';
import 'package:meu_negocio_app/ui/login/model/LoginResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService{


  static const String _IS_LOGGED_IN = "is_logged_in";
  static const String _NAME = "name";


  static Future<Response> login(LoginRequest loginRequest) async {
    Response response = await BaseApi.getInstance().post(
    '/v1/auth/login', <String, dynamic>{
      'email': loginRequest.email,
      'password' : loginRequest.password
    });

    AppSecureStorage.getInstance().setAuthToken(LoginResponse.fromJsonString(response.toString()).authToken);
    AppSecureStorage.getInstance().setRefreshToken(LoginResponse.fromJsonString(response.toString()).refreshToken);

    assert(loginRequest.email != null);

    AppSecureStorage.getInstance().setEmail(loginRequest.email ?? '');

    return response;
  }




}


