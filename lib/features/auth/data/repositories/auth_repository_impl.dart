import 'package:dartz/dartz.dart';

import 'package:devflow/core/network/error/failure_mapper.dart';
import 'package:devflow/core/network/error/failures.dart';
import 'package:devflow/core/storage/token_storage.dart';

import 'package:devflow/features/auth/data/datasources/auth_remote_data_source.dart';

import 'package:devflow/features/auth/domain/entities/auth_session_entity.dart';
import 'package:devflow/features/auth/domain/entities/user_entity.dart';
import 'package:devflow/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final TokenStorage storage;

  AuthRepositoryImpl(this.remote, this.storage);

  @override
  Future<Either<Failure, AuthSessionEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await remote.login(email, password);

      await storage.saveTokens(
        accessToken: response.access,
        refreshToken: response.refresh,
      );

      return Right(
        AuthSessionEntity(
          user: response.user.toEntity(),
          accessToken: response.access,
          refreshToken: response.refresh,
        ),
      );
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> register(
    String email,
    String password,
    String fullName,
  ) async {
    try {
      final response = await remote.register(email, password, fullName);

      await storage.saveTokens(
        accessToken: response.access,
        refreshToken: response.refresh,
      );

      return Right(
        AuthSessionEntity(
          user: response.user.toEntity(),
          accessToken: response.access,
          refreshToken: response.refresh,
        ),
      );
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final user = await remote.getCurrentUser();

      return Right(user.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, bool>> checkAuthStatus() async {
    try {
      final token = await storage.getAccessToken();

      return Right(token != null && token.isNotEmpty);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }
}
