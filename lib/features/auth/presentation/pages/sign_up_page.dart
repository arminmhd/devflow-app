import 'package:devflow/app/router/app_route_names.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/utils/app_messenger.dart';
import 'package:devflow/core/widgets/app_scaffold_widget.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_event.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_state.dart';
import 'package:devflow/features/auth/presentation/widgets/auth_social_buttons.dart';
import 'package:devflow/features/auth/presentation/widgets/sign_up/sign_up_form.dart';
import 'package:devflow/features/auth/presentation/widgets/sign_up/sign_up_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController passwordController;
  late final TextEditingController emailController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.error != null) {
          AppMessenger.showError(state.error!, context);
        }

        if (state.data != null) {
          AppMessenger.showSuccess('Signed up successfully', context);

          context.go(AppRouteNames.signIn);
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return AppScaffold(
            isSafeArea: true,
            body: SingleChildScrollView(
              padding: context.padding.screen,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SignUpHeader(onBackPressed: () => context.pop()),
                  context.spacing.vLg,
                  SignUpForm(
                    formKey: formKey,
                    nameController: nameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    loading: state.loading,

                    onSubmit: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                          RegisterEvent(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            nameController.text.trim(),
                          ),
                        );
                      }
                    },

                    onSignInPressed: () {
                      context.pop();
                    },
                  ),

                  context.spacing.vLg,

                  AuthSocialButtons(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
