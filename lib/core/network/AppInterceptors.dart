import 'package:dio/dio.dart';
import 'package:meu_negocio_app/core/local/AppSecureStorage.dart';
import 'package:meu_negocio_app/core/log/Log.dart';

class AppInterceptors extends Interceptor {


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
      super.onRequest(options, handler);


        options.headers['opa'] = 'asdfsadf';

      if ( options.path.contains('/v1/auth/refresh' )){
        String? token = await AppSecureStorage.getInstance().getRefreshToken();
        options.headers['Authorization'] = 'Bearer $token';
        Log.i('authorization with refresh token');
        Log.w('$token');
      } else {
        options.headers['Authorization'] = 'Bearer ${await AppSecureStorage.getInstance().getAuthToken()}';
        Log.i('authorization with auth token');
      }

    }


  @override
    void onError(DioException err, ErrorInterceptorHandler handler) {
      super.onError(err, handler);
      
    }

}
