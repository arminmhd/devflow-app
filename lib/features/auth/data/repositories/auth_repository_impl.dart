import 'package:devflow/core/network/error/exceptions.dart';
import 'package:devflow/core/network/error/failures.dart';
import 'package:devflow/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:devflow/features/auth/data/models/login_response_model.dart';
import 'package:devflow/features/auth/domian/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<LoginResponseModel> login(String email, String password) async {
    try {
      return await remote.login(email, password);
    } catch (e) {
      throw _mapExceptionToFailure(e);
    }
  }

  @override
  Future<LoginResponseModel> register(
    String email,
    String password,
    String fullName,
  ) async {
    try {
      return await remote.register(email, password, fullName);
    } catch (e) {
      throw _mapExceptionToFailure(e);
    }
  }

  Failure _mapExceptionToFailure(dynamic e) {
    if (e is ServerException) return ServerFailure(e.message);
    if (e is NetworkException) return NetworkFailure(e.message);
    if (e is UnauthorizedException) return UnauthorizedFailure(e.message);
    if (e is ForbiddenException) return ForbiddenFailure(e.message);
    if (e is NotFoundException) return NotFoundFailure(e.message);
    if (e is CacheException) return CacheFailure(e.message);

    return UnknownFailure("Unexpected error occurred");
  }
}
