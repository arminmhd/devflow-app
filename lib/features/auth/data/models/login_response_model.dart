import 'package:devflow/features/auth/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final UserModel user;

  final String access;

  final String refresh;

  const LoginResponseModel({
    required this.user,
    required this.access,
    required this.refresh,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
