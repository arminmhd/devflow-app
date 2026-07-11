import 'package:devflow/features/auth/domian/entities/user_entity.dart';

class UserModel {
  final int id;
  final String email;
  final String fullName;
  final String? avatar;
  final String? bio;
  final bool isVerified;

  const UserModel({
    required this.id,
    required this.email,
    required this.fullName,
    this.avatar,
    this.bio,
    required this.isVerified,
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

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      fullName: fullName,
      avatar: avatar,
      bio: bio,
      isVerified: isVerified,
    );
  }
}
