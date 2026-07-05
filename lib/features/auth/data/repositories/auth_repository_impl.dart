import 'package:devflow/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:devflow/features/auth/data/models/login_response_model.dart';
import 'package:devflow/features/auth/domian/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<LoginResponseModel> login(String email, String password) {
    return remote.login(email, password);
  }

  @override
  Future<LoginResponseModel> register(
    String email,
    String password,
    String fullName,
  ) {
    return remote.register(email, password, fullName);
  }
}
