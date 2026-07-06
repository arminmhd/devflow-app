import 'package:devflow/core/network/interceptors/auth_interceptor.dart';
import 'package:devflow/core/network/interceptors/error_interceptor.dart';
import 'package:devflow/core/network/interceptors/logger_interceptor.dart';
import 'package:dio/dio.dart';

class DioClient {
  static Dio create(Future<String?> Function() getToken) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.106.168.104:8000/api/',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(LoggerInterceptor());
    dio.interceptors.add(AuthInterceptor(getToken));
    dio.interceptors.add(ErrorInterceptor());

    return dio;
  }
}
