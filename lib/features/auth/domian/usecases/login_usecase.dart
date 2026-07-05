import 'package:devflow/features/auth/data/models/login_response_model.dart';
import 'package:devflow/features/auth/domian/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<LoginResponseModel> call(String email, String password) {
    return repository.login(email, password);
  }
}
