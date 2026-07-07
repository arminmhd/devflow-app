import 'package:devflow/features/auth/data/models/login_response_model.dart';
import 'package:devflow/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<LoginResponseModel> login(String email, String password);

  Future<LoginResponseModel> register(
    String email,
    String password,
    String fullName,
  );

  Future<UserModel> getCurrentUser();
}
