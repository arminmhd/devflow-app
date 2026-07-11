import 'package:devflow/core/network/api_config.dart';
import 'package:devflow/core/network/api_endpoints.dart';
import 'package:devflow/core/storage/token_storage.dart';
import 'package:dio/dio.dart';

class RefreshInterceptor extends Interceptor {
  final TokenStorage storage;
  final Dio dio;

  bool refreshing = false;

  RefreshInterceptor(this.storage, this.dio);

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    if (refreshing) {
      return handler.next(err);
    }

    refreshing = true;

    try {
      final refresh = await storage.getRefreshToken();

      if (refresh == null) {
        throw Exception();
      }

      final response = await Dio(
        BaseOptions(baseUrl: ApiConfig.baseUrl),
      ).post(ApiEndpoints.refreshToken, data: {"refresh": refresh});

      final access = response.data['access'];

      final newRefresh = response.data['refresh'];

      if (access == null || newRefresh == null) {
        throw Exception();
      }

      await storage.saveTokens(accessToken: access, refreshToken: newRefresh);

      err.requestOptions.headers['Authorization'] = 'Bearer $access';

      final retry = await dio.fetch(err.requestOptions);

      return handler.resolve(retry);
    } catch (e) {
      await storage.clearTokens();

      return handler.next(err);
    } finally {
      refreshing = false;
    }
  }
}
