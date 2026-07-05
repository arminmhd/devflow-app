import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout) {
      err = DioException(
        requestOptions: err.requestOptions,
        message: 'Connection Timeout',
      );
    }

    if (err.response?.statusCode == 404) {
      err = DioException(
        requestOptions: err.requestOptions,
        message: "Not Found",
      );
    }

    if (err.response?.statusCode == 500) {
      err = DioException(
        requestOptions: err.requestOptions,
        message: 'Server error',
      );
    }

    handler.next(err);
  }
}
