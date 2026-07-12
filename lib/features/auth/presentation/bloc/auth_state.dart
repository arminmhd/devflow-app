import 'package:equatable/equatable.dart';
import 'package:devflow/features/auth/domain/entities/user_entity.dart';

import 'auth_status.dart';

class AuthState extends Equatable {
  final AuthStatus status;

  final bool loading;

  final UserEntity? user;

  final String? error;

  const AuthState({
    required this.status,
    required this.loading,
    this.user,
    this.error,
  });

  factory AuthState.initial() {
    return const AuthState(
      status: AuthStatus.unauthenticated,
      loading: false,
      user: null,
      error: null,
    );
  }

  AuthState copyWith({
    AuthStatus? status,

    bool? loading,

    UserEntity? user,

    String? error,
  }) {
    return AuthState(
      status: status ?? this.status,

      loading: loading ?? this.loading,

      user: user ?? this.user,

      error: error,
    );
  }

  @override
  List<Object?> get props => [status, loading, user, error];
}
