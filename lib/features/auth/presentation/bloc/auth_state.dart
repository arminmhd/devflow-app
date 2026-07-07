import 'package:devflow/features/auth/data/models/login_response_model.dart';
import 'package:devflow/features/auth/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool loading;
  final UserModel? user;
  final LoginResponseModel? data;
  final String? error;

  const AuthState({required this.loading, this.data, this.error, this.user});

  factory AuthState.initial() => const AuthState(loading: false);

  AuthState copyWith({
    UserModel? user,
    bool? loading,
    LoginResponseModel? data,
    String? error,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      data: data ?? this.data,
      error: error,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [loading, data, error, user];
}
