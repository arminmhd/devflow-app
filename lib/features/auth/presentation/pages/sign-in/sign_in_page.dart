import 'package:devflow/app/router/app_route_names.dart';
import 'package:devflow/core/services/app_snackbar_service.dart';
import 'package:devflow/core/widgets/app_scaffold_widget.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_state.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_status.dart';
import 'package:devflow/features/auth/presentation/pages/sign-in/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.error != null) {
          AppMessenger.showError(state.error!);
        }

        if (state.status == AuthStatus.authenticated && state.user != null) {
          AppMessenger.showSuccess('Authorization successful');
          context.go(AppRouteNames.home);
        }
      },
      child: const AppScaffold(isSafeArea: true, body: SignInView()),
    );
  }
}
