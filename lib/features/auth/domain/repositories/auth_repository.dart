import 'package:dartz/dartz.dart';

import 'package:devflow/core/network/error/failures.dart';

import '../entities/user_entity.dart';
import '../entities/auth_session_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthSessionEntity>> login(
    String email,
    String password,
  );

  Future<Either<Failure, AuthSessionEntity>> register(
    String email,
    String password,
    String fullName,
  );

  Future<Either<Failure, UserEntity>> getCurrentUser();

  Future<Either<Failure, bool>> checkAuthStatus();
}
