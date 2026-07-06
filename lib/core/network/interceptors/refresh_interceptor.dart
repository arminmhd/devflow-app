import 'package:devflow/core/storage/token_storage.dart';
import 'package:dio/dio.dart';

class RefreshInterceptor extends Interceptor {
  final TokenStorage storage;
  final Dio dio;

  RefreshInterceptor(this.storage, this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshToken = await storage.getRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        return handler.next(err);
      }

      try {
        final refreshDio = Dio(
          BaseOptions(baseUrl: 'http://10.106.168.74:8000/api/'),
        );

        final response = await refreshDio.post(
          '/accounts/refresh/',
          data: {'refresh': refreshToken},
        );

        final newAccess = response.data['access'];

        if (newAccess == null) {
          print("NEW ACCESS TOKEN IS NULL");
          return handler.next(err);
        }

        await storage.saveAccessToken(newAccess);

        final req = err.requestOptions;
        req.headers['Authorization'] = 'Bearer $newAccess';

        final retryResponse = await dio.fetch(req);
        return handler.resolve(retryResponse);
      } catch (e) {
        return handler.next(err);
      }
    }

    handler.next(err);
  }
}
