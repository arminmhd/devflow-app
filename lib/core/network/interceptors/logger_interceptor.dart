import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('Request: ${options.method}  ${options.uri}');
    print('Header: ${options.headers}');
    print('Data: ${options.data}');

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Response: ${response.statusCode} ${response.requestOptions.uri}');
    print('Data: ${response.data}');

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('Error: ${err.response?.statusCode} ${err.requestOptions.uri}');
    print('Message: ${err.message}');

    handler.next(err);
  }
}
