import 'package:devflow/core/network/error/failures.dart';
import 'package:devflow/features/auth/domain/entities/auth_session_entity.dart';
import 'package:devflow/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, AuthSessionEntity>> call(
    String email,
    String password,
  ) {
    return repository.login(email, password);
  }
}
