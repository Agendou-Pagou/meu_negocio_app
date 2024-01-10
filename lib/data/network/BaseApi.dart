import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class BaseApi{

  Dio? _dio;

  static BaseApi? _instance;


  BaseApi._internal (): _dio = Dio() {
    _dio!.options.baseUrl = 'http://192.168.0.107:3000/';
  }

  static BaseApi getInstance() => _instance ??= BaseApi._internal(); 

  Future<Response> get(String path, Map<String, dynamic>? queryParameters) async {
    try {
      final response = await _dio!.get(path, queryParameters: queryParameters);
      return response;
    } catch (error) {
      Logger().e('Error in API request: $error');
      rethrow;
    }
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      final response = await _dio!.post(path, data: data);
      return response;
    } catch (error) {
      Logger().e('Error in API request: $error');
      rethrow;
    }
  }

}
