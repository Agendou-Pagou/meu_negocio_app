import 'dart:async';

import 'package:dio/dio.dart';
import 'package:meu_negocio_app/core/local/AppSecureStorage.dart';

class AppInterceptors extends Interceptor {


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
      super.onRequest(options, handler);

      if ( options.path.contains('/v1/auth/refresh' )){
        options.headers['Authorization'] = 'Bearer ${await AppSecureStorage.getInstance().getRefreshToken()}';
      } else {
        options.headers['Authorization'] = 'Bearer ${await AppSecureStorage.getInstance().getAuthToken()}';
      }
    }


  @override
    void onError(DioException err, ErrorInterceptorHandler handler) {
      super.onError(err, handler);

      
    }

}
