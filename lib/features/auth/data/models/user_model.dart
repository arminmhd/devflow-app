import 'package:devflow/features/auth/domian/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.fullName,
    required super.avatar,
    required super.bio,
    required super.isVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      fullName: json['fullName'],
      avatar: json['avatar'],
      bio: json['bio'],
      isVerified: json['isVerified'],
    );
  }
}
