import 'package:devflow/core/network/api_endpoints.dart';
import 'package:devflow/core/network/error/exceptions.dart';
import 'package:devflow/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:devflow/features/auth/data/models/login_response_model.dart';
import 'package:dio/dio.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final Dio dio;

  AuthRemoteDatasourceImpl(this.dio);

  @override
  Future<LoginResponseModel> login(String email, String password) async {
    try {
      final response = await dio.post(
        ApiEndpoints.login,
        data: {"email": email, "password": password},
      );

      if (response.data is Map<String, dynamic>) {
        return LoginResponseModel.fromJson(
          response.data as Map<String, dynamic>,
        );
      }

      throw ServerException("Invalid login response format");
    } on DioException {
      rethrow;
    } catch (e) {
      throw UnknownException("Unexpected error occurred");
    }
  }

  @override
  Future<LoginResponseModel> register(
    String email,
    String password,
    String fullName,
  ) async {
    try {
      final response = await dio.post(
        ApiEndpoints.register,
        data: {"email": email, "password": password, "full_name": fullName},
      );

      if (response.data is Map<String, dynamic>) {
        return LoginResponseModel.fromJson(
          response.data as Map<String, dynamic>,
        );
      }

      throw ServerException("Invalid register response format");
    } on DioException {
      rethrow;
    } catch (e) {
      throw UnknownException("Unexpected error occurred");
    }
  }
}
