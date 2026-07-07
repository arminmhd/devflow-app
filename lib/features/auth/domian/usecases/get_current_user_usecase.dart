import 'package:devflow/features/auth/data/models/user_model.dart';
import 'package:devflow/features/auth/domian/repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  Future<UserModel> call() {
    return repository.getCurrentUser();
  }
}
