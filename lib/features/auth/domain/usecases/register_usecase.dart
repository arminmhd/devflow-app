import 'package:dartz/dartz.dart';

import 'package:devflow/core/network/error/failures.dart';
import 'package:devflow/features/auth/domain/entities/auth_session_entity.dart';
import 'package:devflow/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, AuthSessionEntity>> call(
    String email,
    String password,
    String fullName,
  ) {
    return repository.register(email, password, fullName);
  }
}
