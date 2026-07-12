import 'package:devflow/core/network/api/api_config.dart';
import 'package:devflow/core/network/interceptors/auth_interceptor.dart';
import 'package:devflow/core/network/interceptors/error_interceptor.dart';
import 'package:devflow/core/network/interceptors/logger_interceptor.dart';
import 'package:devflow/core/network/interceptors/refresh_interceptor.dart';
import 'package:devflow/core/storage/token_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

class DioClient {
  static Dio create(TokenStorage storage) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,

        connectTimeout: const Duration(seconds: 15),

        receiveTimeout: const Duration(seconds: 15),

        sendTimeout: const Duration(seconds: 15),

        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(AuthInterceptor(storage));

    dio.interceptors.add(RefreshInterceptor(storage, dio));

    dio.interceptors.add(ErrorInterceptor());

    if (kDebugMode) {
      dio.interceptors.add(LoggerInterceptor());
    }

    return dio;
  }
}
