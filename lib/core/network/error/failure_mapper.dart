import 'package:devflow/core/network/error/exceptions.dart';
import 'package:devflow/core/network/error/failures.dart';
import 'package:dio/dio.dart';

class FailureMapper {
  static Failure map(dynamic e) {
    if (e == null) {
      return UnknownFailure("Unexpected error occurred");
    }

    final error = e is DioException ? e.error : e;

    if (error is ServerException) return ServerFailure(error.message);
    if (error is NetworkException) return NetworkFailure(error.message);
    if (error is UnauthorizedException) {
      return UnauthorizedFailure(error.message);
    }
    if (error is ForbiddenException) return ForbiddenFailure(error.message);
    if (error is NotFoundException) return NotFoundFailure(error.message);
    if (error is CacheException) return CacheFailure(error.message);

    if (error is Exception) {
      return UnknownFailure("Unexpected error occurred");
    }

    return UnknownFailure("Unexpected error occurred");
  }
}
