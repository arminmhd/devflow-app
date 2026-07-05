import 'package:devflow/features/auth/data/models/login_response_model.dart';

abstract class AuthRepository {
  Future<LoginResponseModel> login(String email, String password);
  Future<LoginResponseModel> register(
    String email,
    String password,
    String fullName,
  );
}
