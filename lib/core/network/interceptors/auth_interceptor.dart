import 'package:devflow/core/storage/token_storage.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage storage;

  AuthInterceptor(this.storage);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final requiresAuth = options.extra['requiresAuth'] ?? true;

    if (!requiresAuth) {
      return handler.next(options);
    }

    final token = await storage.getAccessToken();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}
