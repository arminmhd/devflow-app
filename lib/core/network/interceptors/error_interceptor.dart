import 'package:devflow/core/network/error/exceptions.dart';
import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout) {
      return handler.next(
        err.copyWith(error: NetworkException("Network error")),
      );
    }

    final status = err.response?.statusCode;

    if (status == null) {
      return handler.next(err);
    }

    final message = _extractMessage(err.response?.data);

    return handler.next(
      err.copyWith(error: _mapStatusToException(status, message)),
    );
  }

  String _extractMessage(dynamic data) {
    if (data is Map) {
      final value = data['detail'] ?? data['message'] ?? data['error'];

      if (value is String) {
        return value;
      }
    }

    return "Unexpected error";
  }

  Exception _mapStatusToException(int status, String message) {
    switch (status) {
      case 400:
        return ServerException(message);

      case 401:
        return UnauthorizedException(message);

      case 403:
        return ForbiddenException(message);

      case 404:
        return NotFoundException(message);

      default:
        if (status >= 500) {
          return ServerException(message);
        }

        return UnknownException(message);
    }
  }
}
