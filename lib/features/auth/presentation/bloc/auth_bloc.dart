import 'package:devflow/features/auth/domain/usecases/check_auth_status_use_case.dart';
import 'package:devflow/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:devflow/features/auth/domain/usecases/login_usecase.dart';
import 'package:devflow/features/auth/domain/usecases/register_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'auth_event.dart';
import 'auth_state.dart';
import 'auth_status.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final GetCurrentUserUseCase currentUserUseCase;
  final CheckAuthStatusUseCase checkAuthStatusUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.currentUserUseCase,
    required this.checkAuthStatusUseCase,
  }) : super(AuthState.initial()) {
    on<LoginEvent>(_onLogin);

    on<RegisterEvent>(_onRegister);

    on<GetCurrentUserEvent>(_onGetCurrentUser);

    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loading: true, error: null));

    final result = await loginUseCase(event.email, event.password);

    result.fold(
      (failure) {
        emit(state.copyWith(loading: false, error: failure.message));
      },

      (session) {
        emit(
          state.copyWith(
            status: AuthStatus.authenticated,
            loading: false,
            user: session.user,
            error: null,
          ),
        );

        add(GetCurrentUserEvent());
      },
    );
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loading: true, error: null));

    final result = await registerUseCase(
      event.email,
      event.password,
      event.fullName,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(loading: false, error: failure.message));
      },

      (session) {
        emit(
          state.copyWith(
            status: AuthStatus.authenticated,
            loading: false,
            user: session.user,
            error: null,
          ),
        );
      },
    );
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await checkAuthStatusUseCase();

    result.fold(
      (failure) {
        emit(AuthState.initial());
      },

      (authenticated) {
        if (authenticated) {
          add(GetCurrentUserEvent());
        } else {
          emit(AuthState.initial());
        }
      },
    );
  }

  Future<void> _onGetCurrentUser(
    GetCurrentUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await currentUserUseCase();

    result.fold(
      (failure) {
        emit(state.copyWith(error: failure.message));
      },

      (user) {
        emit(state.copyWith(user: user, error: null));
      },
    );
  }
}
