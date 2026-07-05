import 'package:devflow/core/network/api_endpoints.dart';
import 'package:devflow/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:devflow/features/auth/data/models/login_response_model.dart';
import 'package:dio/dio.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio dio;

  AuthRemoteDatasourceImpl(this.dio);

  @override
  Future<LoginResponseModel> login(String email, String password) async {
    final response = await dio.post(
      ApiEndpoints.login,
      data: {"email": email, "password": password},
    );

    return LoginResponseModel.fromJson(response.data);
  }

  @override
  Future<LoginResponseModel> register(
    String email,
    String password,
    String fullName,
  ) async {
    final response = await dio.post(
      ApiEndpoints.register,
      data: {"email": email, "password": password, 'full_name': fullName},
    );

    return LoginResponseModel.fromJson(response.data);
  }
}
