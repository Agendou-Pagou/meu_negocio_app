
import 'package:dio/dio.dart';
import 'package:meu_negocio_app/data/BaseApi.dart';
import 'package:meu_negocio_app/ui/register/model/RegisterRequest.dart';

class RegisterService{

  static Future<Response> register(RegisterRequest registerRequest) async{
    return BaseApi.getInstance().post(
    '/v1/users', <String, dynamic>{
      'name' : registerRequest.name,
      'email': registerRequest.email,
      'password' : registerRequest.password
    });
  }

}
