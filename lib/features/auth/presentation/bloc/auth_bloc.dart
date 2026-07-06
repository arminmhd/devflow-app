import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../../../core/network/error/failures.dart';
import '../../../../core/storage/token_storage.dart';
import '../../domian/usecases/login_usecase.dart';
import '../../domian/usecases/register_usecase.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final TokenStorage storage;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.storage,
  }) : super(AuthState.initial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loading: true, error: null));

    try {
      final result = await loginUseCase(event.email, event.password);

      await storage.saveAccessToken(result.access);
      await storage.saveRefreshToken(result.refresh);

      emit(state.copyWith(loading: false, data: result, error: null));
    } catch (e) {
      final failure = e is Failure ? e : UnknownFailure("Unexpected error");
      emit(state.copyWith(loading: false, error: failure.message));
    }
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loading: true, error: null));

    try {
      final result = await registerUseCase(
        event.email,
        event.password,
        event.fullName,
      );

      emit(state.copyWith(loading: false, data: result, error: null));
    } catch (e) {
      final failure = e is Failure ? e : UnknownFailure("Unexpected error");
      emit(state.copyWith(loading: false, error: failure.message));
    }
  }
}
