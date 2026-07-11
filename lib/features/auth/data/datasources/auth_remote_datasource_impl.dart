import 'package:devflow/core/network/api_endpoints.dart';
import 'package:devflow/core/network/error/exceptions.dart';
import 'package:devflow/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:devflow/features/auth/data/models/login_response_model.dart';
import 'package:devflow/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDatasourceImpl(this.dio);

  @override
  Future<LoginResponseModel> login(String email, String password) async {
    final response = await dio.post(
      ApiEndpoints.login,
      data: {"email": email, "password": password},
    );

    if (response.data is Map<String, dynamic>) {
      return LoginResponseModel.fromJson(response.data);
    }

    throw const ServerException("Invalid login response");
  }

  @override
  Future<LoginResponseModel> register(
    String email,
    String password,
    String fullName,
  ) async {
    final response = await dio.post(
      ApiEndpoints.register,
      data: {"email": email, "password": password, "full_name": fullName},
    );

    if (response.data is Map<String, dynamic>) {
      return LoginResponseModel.fromJson(response.data);
    }

    throw const ServerException("Invalid register response");
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final response = await dio.get(ApiEndpoints.profile);

    if (response.data is Map<String, dynamic>) {
      return UserModel.fromJson(response.data);
    }

    throw const ServerException("Invalid user response");
  }
}
