import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String email;
  final String fullName;
  final String? avatar;
  final String bio;
  final String isVerified;

  const UserEntity({
    required this.id,
    required this.email,
    required this.fullName,
    this.avatar,
    required this.bio,
    required this.isVerified,
  });

  @override
  List<Object?> get props => [id, email, fullName, avatar, bio, isVerified];
}
