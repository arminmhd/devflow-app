import 'package:devflow/core/network/error/failure_mapper.dart';
import 'package:devflow/features/auth/domian/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/login_response_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remote;

  AuthRepositoryImpl(this.remote);
  @override
  Future<LoginResponseModel> login(String email, String password) async {
    try {
      return await remote.login(email, password);
    } catch (e) {
      throw FailureMapper.map(e);
    }
  }

  @override
  Future<LoginResponseModel> register(
    String email,
    String password,
    String fullName,
  ) async {
    try {
      return await remote.register(email, password, fullName);
    } catch (e) {
      throw FailureMapper.map(e);
    }
  }
}
