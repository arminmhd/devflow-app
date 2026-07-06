import 'package:devflow/core/network/error/exceptions.dart';
import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      final data = err.response?.data;
      String message = "Unexpected server error.";

      if (data is Map) {
        message = data["error"] ?? data["detail"] ?? data["message"] ?? message;
      }

      final status = err.response?.statusCode;
      final mapped = _mapStatusToException(status, message);

      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: mapped,
          response: err.response,
        ),
      );
    }

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.connectionError) {
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: NetworkException("No internet connection."),
        ),
      );
    }

    return handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: UnknownException("Unexpected error occurred"),
      ),
    );
  }

  Exception _mapStatusToException(int? status, String message) {
    switch (status) {
      case 400:
        return ServerException(message);
      case 401:
        return UnauthorizedException(message);
      case 403:
        return ForbiddenException(message);
      case 404:
        return NotFoundException(message);
      case 500:
        return ServerException(message);
      default:
        return ServerException(message);
    }
  }
}
