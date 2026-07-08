import 'package:devflow/core/network/api_endpoints.dart';
import 'package:devflow/core/storage/token_storage.dart';
import 'package:dio/dio.dart';

class RefreshInterceptor extends Interceptor {
  final TokenStorage storage;
  final Dio dio;

  RefreshInterceptor(this.storage, this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        err.response?.data['code'] == 'token_not_valid') {
      final refreshToken = await storage.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        return handler.next(err);
      }

      try {
        final response = await dio.post(
          ApiEndpoints.refreshToken,
          data: {'refresh': refreshToken},
        );

        final newAccess = response.data['access'];
        final newRefresh = response.data['refresh'];

        if (newAccess == null || newRefresh == null) {
          return handler.next(err);
        }

        await storage.saveAccessToken(newAccess);
        await storage.saveRefreshToken(newRefresh);

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
