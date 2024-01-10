
import 'package:dio/dio.dart';
import 'package:meu_negocio_app/core/network/BaseApi.dart';
import 'package:meu_negocio_app/ui/login/model/LoginRequest.dart';

class LoginService{

  static Future<Response> login(LoginRequest loginRequest) async{
    return BaseApi.getInstance().post(
    '/v1/auth/login', <String, dynamic>{
      'email': loginRequest.email,
      'password' : loginRequest.password
    });
  }

}


