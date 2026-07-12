import 'package:dartz/dartz.dart';

import 'package:devflow/core/network/error/failures.dart';
import 'package:devflow/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckAuthStatusUseCase {
  final AuthRepository repository;

  CheckAuthStatusUseCase(this.repository);

  Future<Either<Failure, bool>> call() {
    return repository.checkAuthStatus();
  }
}
