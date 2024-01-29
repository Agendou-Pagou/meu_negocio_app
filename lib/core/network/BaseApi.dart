import 'package:dio/dio.dart';
import 'package:meu_negocio_app/core/network/AppInterceptors.dart';

class BaseApi{

  final Dio? _dio;

  static BaseApi? _instance;


  BaseApi._internal (): _dio = Dio() {

    _dio!.options.baseUrl = 'http://192.168.1.101:3000/';
    _dio!.options.connectTimeout = const Duration(seconds: 5000);
    _dio!.options.receiveTimeout = const Duration(seconds: 5000);

    _dio!.interceptors.add (AppInterceptors());
  }

  static BaseApi getInstance() => _instance ??= BaseApi._internal(); 

  Future<Response> get(String path, Map<String, dynamic>? queryParameters) async {
    return _dio!.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, Object? data) async {
    return _dio!.post(path, data: data);
  }

}
