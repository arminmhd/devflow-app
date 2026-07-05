import 'package:devflow/features/auth/data/models/login_response_model.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool loading;
  final LoginResponseModel? data;
  final String? error;

  const AuthState({required this.loading, this.data, this.error});

  factory AuthState.initial() => const AuthState(loading: false);

  AuthState copyWith({bool? loading, LoginResponseModel? data, String? error}) {
    return AuthState(
      loading: loading ?? this.loading,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [loading, data, error];
}
