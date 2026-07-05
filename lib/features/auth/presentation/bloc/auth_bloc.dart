import 'package:devflow/core/storage/token_storage.dart';
import 'package:devflow/features/auth/domian/usecases/login_usecase.dart';
import 'package:devflow/features/auth/domian/usecases/register_usecase.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_event.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc({required this.loginUseCase, required this.registerUseCase})
    : super(AuthState.initial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      final result = await loginUseCase(event.email, event.password);

      await TokenStorage.saveAccessToken(result.access);
      await TokenStorage.saveRefreshToken(result.refresh);

      emit(state.copyWith(loading: false, data: result));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loading: true));

    try {
      final result = await registerUseCase(
        event.email,
        event.password,
        event.fullName,
      );
      emit(state.copyWith(loading: false, data: result));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}
