import 'package:devflow/features/auth/data/models/login_response_model.dart';
import 'package:devflow/features/auth/domian/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<LoginResponseModel> call(
    String email,
    String password,
    String fullName,
  ) {
    return repository.register(email, password, fullName);
  }
}
