import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/utils/app_auth_validators.dart';
import 'package:devflow/core/widgets/app_button_widget.dart';
import 'package:devflow/core/widgets/app_input_widget.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final VoidCallback? onLoginPressed;
  final VoidCallback? onForgotPassword;
  final GlobalKey<FormState> formKey;
  final bool isLoading;

  const SignInForm({
    super.key,
    required this.usernameController,
    required this.passwordController,
    this.isLoading = false,
    this.onLoginPressed,
    this.onForgotPassword,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppInput(
            controller: usernameController,
            hint: 'Email',
            fillColor: context.colors.onPrimary.withValues(alpha: .09),
            prefixIcon: const Icon(Icons.person),
            validator: AppAuthValidators.email,
          ),

          context.spacing.vMd,

          AppInput(
            controller: passwordController,
            hint: 'Password',
            obscure: true,
            fillColor: context.colors.onPrimary.withValues(alpha: .09),
            prefixIcon: const Icon(Icons.lock),
            validator: AppAuthValidators.password,
          ),

          context.spacing.vLg,

          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: onForgotPassword,
              child: const Text('Forgot Password?'),
            ),
          ),

          context.spacing.vLg,

          AppButton(
            label: 'Sign In',
            loading: isLoading,
            onPressed: isLoading ? null : onLoginPressed,
          ),
        ],
      ),
    );
  }
}
