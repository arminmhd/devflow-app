import 'package:devflow/features/auth/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class AuthSessionEntity extends Equatable {
  final UserEntity user;
  final String accessToken;
  final String refreshToken;

  const AuthSessionEntity({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  List<Object?> get props => [user, accessToken, refreshToken];
}
