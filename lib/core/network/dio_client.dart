import 'package:devflow/core/network/interceptors/auth_interceptor.dart';
import 'package:devflow/core/network/interceptors/error_interceptor.dart';
import 'package:devflow/core/network/interceptors/logger_interceptor.dart';
import 'package:devflow/core/network/interceptors/refresh_interceptor.dart';
import 'package:devflow/core/storage/token_storage.dart';
import 'package:dio/dio.dart';

class DioClient {
  static Dio create(TokenStorage storage) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.106.168.72:8000/api/',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(LoggerInterceptor());
    dio.interceptors.add(AuthInterceptor(storage));
    dio.interceptors.add(RefreshInterceptor(storage, dio));
    dio.interceptors.add(ErrorInterceptor());

    return dio;
  }
}
