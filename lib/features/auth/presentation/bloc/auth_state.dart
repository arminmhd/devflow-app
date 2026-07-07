import 'package:devflow/features/auth/data/models/login_response_model.dart';
import 'package:devflow/features/auth/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

enum AuthStatus { initial, loading, authenticated, error }

class AuthState extends Equatable {
  final AuthStatus status;
  final bool loading;
  final UserModel? user;
  final LoginResponseModel? data;
  final String? error;

  const AuthState({
    required this.loading,
    this.data,
    this.error,
    this.user,
    required this.status,
  });

  factory AuthState.initial() =>
      const AuthState(status: AuthStatus.initial, loading: false);

  AuthState copyWith({
    AuthStatus? status,
    UserModel? user,
    bool? loading,
    LoginResponseModel? data,
    String? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      loading: loading ?? this.loading,
      data: data ?? this.data,
      error: error,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [status, loading, data, error, user];
}
