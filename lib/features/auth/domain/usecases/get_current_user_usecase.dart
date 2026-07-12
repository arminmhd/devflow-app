import 'package:dartz/dartz.dart';

import 'package:devflow/core/network/error/failures.dart';
import 'package:devflow/features/auth/domain/entities/user_entity.dart';
import 'package:devflow/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call() {
    return repository.getCurrentUser();
  }
}
