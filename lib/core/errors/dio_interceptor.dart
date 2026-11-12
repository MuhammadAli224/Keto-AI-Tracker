import 'package:dio/dio.dart';

import '../logger/app_logger.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLogger.i('HTTP ${options.method} request');
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final method = err.requestOptions.method;
    final status = err.response?.statusCode;
    AppLogger.e('HTTP $method failed (${err.type.name}, status: $status)');
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final method = response.requestOptions.method;
    AppLogger.i('HTTP $method completed (status: ${response.statusCode})');
    super.onResponse(response, handler);
  }
}
