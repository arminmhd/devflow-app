import 'package:devflow/app/router/app_route_names.dart';
import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/design/spacing/app_spaces.dart';
import 'package:devflow/core/services/app_snackbar_service.dart';
import 'package:devflow/core/widgets/app_scaffold_widget.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_event.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_state.dart';
import 'package:devflow/features/auth/presentation/widgets/auth_divider.dart';
import 'package:devflow/features/auth/presentation/widgets/auth_social_buttons.dart';
import 'package:devflow/features/auth/presentation/widgets/sign_in/sign_in_footer.dart';
import 'package:devflow/features/auth/presentation/widgets/sign_in/sign_in_form.dart';
import 'package:devflow/features/auth/presentation/widgets/sign_in/sign_in_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.error != null) {
          AppMessenger.showError(state.error!);
        }

        if (state.status == AuthStatus.authenticated && state.user == null) {
          AppMessenger.showSuccess('Authorization successful');

          context.go(AppRouteNames.home);
        }
      },
      child: AppScaffold(
        isSafeArea: true,
        body: SingleChildScrollView(
          padding: AppInsets.screen,
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Column(
                children: [
                  SignInInfo(),

                  AppSpaces.xl,

                  SignInForm(
                    formKey: formKey,
                    usernameController: usernameController,
                    passwordController: passwordController,
                    isLoading: state.loading,
                    onLoginPressed: () {
                      if (!formKey.currentState!.validate()) return;

                      context.read<AuthBloc>().add(
                        LoginEvent(
                          usernameController.text.trim(),
                          passwordController.text.trim(),
                        ),
                      );
                    },
                  ),

                  AppSpaces.lg,

                  AuthDivider(),

                  AppSpaces.xl,

                  AuthSocialButtons(),

                  AppSpaces.vMd,

                  SignInFooter(
                    onSignUpPressed: () {
                      context.push(AppRouteNames.signUp);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
