import 'package:devflow/features/auth/data/models/user_model.dart';

class LoginResponseModel {
  final UserModel user;
  final String access;
  final String refresh;

  LoginResponseModel({
    required this.user,
    required this.access,
    required this.refresh,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      user: UserModel.fromJson(json['user']),
      access: json['access'],
      refresh: json['refresh'],
    );
  }
}
