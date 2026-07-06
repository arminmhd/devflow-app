import 'package:devflow/core/network/error/exceptions.dart';
import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Timeout errors
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout) {
      throw NetworkException("Connection timeout. Please check your internet.");
    }

    // No internet
    if (err.type == DioExceptionType.connectionError) {
      throw NetworkException("No internet connection.");
    }

    // Server responded with error
    if (err.type == DioExceptionType.badResponse) {
      final status = err.response?.statusCode;

      if (status == 400) throw ServerException("Invalid request.");
      if (status == 401) {
        throw UnauthorizedException("Unauthorized. Please login again.");
      }
      if (status == 403) throw ForbiddenException("You don't have permission.");
      if (status == 404) throw NotFoundException("Resource not found.");
      if (status == 500) {
        throw ServerException("Server error. Please try again later.");
      }

      throw ServerException("Unexpected server error.");
    }

    // Unknown error
    throw UnknownException("Unexpected error occurred");
  }
}
