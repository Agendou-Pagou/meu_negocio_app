import 'dart:async';

import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {

  @override
    void onResponse(Response response, ResponseInterceptorHandler handler) {
      // TODO: implement onResponse
      super.onResponse(response, handler);
    }


  @override
    void onError(DioException err, ErrorInterceptorHandler handler) {
      // TODO: implement onError
      super.onError(err, handler);
    }

}
