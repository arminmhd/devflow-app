import 'package:devflow/features/auth/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;

  final String email;

  @JsonKey(name: 'full_name')
  final String fullName;

  final String? avatar;

  final String? bio;

  @JsonKey(name: 'is_verified')
  final bool isVerified;

  const UserModel({
    required this.id,
    required this.email,
    required this.fullName,
    this.avatar,
    this.bio,
    required this.isVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

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
