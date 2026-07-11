import 'package:devflow/core/network/error/failures.dart';
import 'package:devflow/features/auth/domian/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);

  Future<Either<Failure, UserEntity>> register(
    String email,
    String password,
    String fullName,
  );

  Future<Either<Failure, UserEntity>> getCurrentUser();
}
