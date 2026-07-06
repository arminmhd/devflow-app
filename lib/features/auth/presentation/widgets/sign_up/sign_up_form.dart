import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/utils/app_auth_validators.dart';
import 'package:devflow/core/widgets/app_button_widget.dart';
import 'package:devflow/core/widgets/app_input_widget.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState>? formKey;
  final bool loading;
  final VoidCallback? onSubmit;
  final VoidCallback? onSignInPressed;

  const SignUpForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.loading,
    required this.onSubmit,
    this.onSignInPressed,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppInput(
            controller: nameController,
            hint: 'Full Name',
            fillColor: context.colors.onPrimary.withValues(alpha: .09),
            validator: AppAuthValidators.fullName,
          ),

          context.spacing.vMd,

          AppInput(
            controller: emailController,
            hint: 'Email',
            fillColor: context.colors.onPrimary.withValues(alpha: .09),
            validator: AppAuthValidators.email,
          ),

          context.spacing.vMd,

          AppInput(
            controller: passwordController,
            hint: 'Password',
            obscure: true,
            fillColor: context.colors.onPrimary.withValues(alpha: .09),
            validator: AppAuthValidators.password,
          ),

          context.spacing.vMd,

          AppInput(
            controller: confirmPasswordController,
            hint: 'Confirm Password',
            obscure: true,
            fillColor: context.colors.onPrimary.withValues(alpha: .09),
            validator: (value) => AppAuthValidators.confirmPassword(
              value,
              passwordController.text.trim(),
            ),
          ),

          context.spacing.vHuge,

          AppButton(
            label: 'Create Account',
            loading: loading,
            onPressed: loading ? null : onSubmit,
          ),

          context.spacing.vMd,

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppText('Already have an account?'),
              context.spacing.hSm,
              GestureDetector(
                onTap: onSignInPressed,
                child: AppText(
                  'Sign in',
                  style: context.textStyle.bodyLarge.copyWith(
                    color: context.colors.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
