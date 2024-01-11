import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:meu_negocio_app/core/log/Log.dart';

class BaseApi{

  Dio? _dio;

  static BaseApi? _instance;


  BaseApi._internal (): _dio = Dio() {
    _dio!.options.baseUrl = 'http://192.168.0.107:3000/';
  }

  static BaseApi getInstance() => _instance ??= BaseApi._internal(); 

  Future<Response> get(String path, Map<String, dynamic>? queryParameters) async {
    return _dio!.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, dynamic data) async {
    return _dio!.post(path, data: data);
  }

}
