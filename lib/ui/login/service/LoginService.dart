import 'package:local_auth/local_auth.dart';
import 'package:dio/dio.dart';
import 'package:meu_negocio_app/core/network/BaseApi.dart';
import 'package:meu_negocio_app/ui/login/model/LoginRequest.dart';
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

    return response;

  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance(); 
    return pref.getBool(_IS_LOGGED_IN) ?? false;
  }

  static Future<String> getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance(); 
    return pref.getString(_NAME) ?? "null";
  }

  static Future<void> logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance(); 
    pref.clear();
  }


  static Future<bool> authenticate() async {
    final _auth = LocalAuthentication();
    return await _auth.authenticate(
      localizedReason: 'Touch your finger on the sensor to login');

  }



}


