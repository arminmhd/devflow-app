import 'package:devflow/features/auth/domian/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.fullName,
    super.avatar,
    super.bio,
    required super.isVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      fullName: json['full_name'] ?? '',
      avatar: json['avatar'],
      bio: json['bio'],
      isVerified: json['is_verified'] ?? false,
    );
  }
}
