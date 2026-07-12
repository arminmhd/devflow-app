import 'package:devflow/core/design/spacing/app_spaces.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/utils/app_auth_validators.dart';
import 'package:devflow/core/widgets/app_button_widget.dart';
import 'package:devflow/core/widgets/app_input_widget.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_event.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!formKey.currentState!.validate()) return;

    context.read<AuthBloc>().add(
      RegisterEvent(
        emailController.text.trim(),
        passwordController.text.trim(),
        nameController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              AppInput(
                controller: nameController,
                hint: 'Full Name',
                validator: AppAuthValidators.fullName,
                fillColor: context.colors.onPrimary.withValues(alpha: .09),
              ),

              AppSpaces.vMd,

              AppInput(
                controller: emailController,
                hint: 'Email',
                validator: AppAuthValidators.email,
                fillColor: context.colors.onPrimary.withValues(alpha: .09),
              ),

              AppSpaces.vMd,

              AppInput(
                controller: passwordController,
                hint: 'Password',
                obscure: true,
                validator: AppAuthValidators.password,
                fillColor: context.colors.onPrimary.withValues(alpha: .09),
              ),

              AppSpaces.vMd,

              AppInput(
                controller: confirmPasswordController,
                hint: 'Confirm Password',
                obscure: true,
                validator: (value) => AppAuthValidators.confirmPassword(
                  value,
                  passwordController.text.trim(),
                ),
                fillColor: context.colors.onPrimary.withValues(alpha: .09),
              ),

              AppSpaces.xl,

              AppButton(
                label: 'Create Account',
                loading: state.loading,
                onPressed: state.loading ? null : _submit,
              ),

              AppSpaces.vMd,

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText('Already have an account?'),
                  AppSpaces.sm,
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: AppText(
                      'Sign in',
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: context.colors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
