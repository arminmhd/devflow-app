import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_button_widget.dart';
import 'package:devflow/core/widgets/app_input_widget.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  const SignUpForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.userNameController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          AppInput(
            controller: nameController,
            hint: 'Full Name',
            fillColor: context.colors.onPrimary.withValues(alpha: .09),
          ),
          context.spacing.vMd,
          AppInput(
            controller: emailController,
            hint: 'Email',
            fillColor: context.colors.onPrimary.withValues(alpha: .09),
          ),
          context.spacing.vMd,

          AppInput(
            controller: userNameController,
            hint: 'Username',
            fillColor: context.colors.onPrimary.withValues(alpha: .09),
          ),
          context.spacing.vMd,

          AppInput(
            controller: passwordController,
            hint: 'Password',
            fillColor: context.colors.onPrimary.withValues(alpha: .09),
            obscure: true,
          ),
          context.spacing.vMd,

          AppInput(
            controller: confirmPasswordController,
            hint: 'Confirm Password',
            fillColor: context.colors.onPrimary.withValues(alpha: .09),
            obscure: true,
          ),

          context.spacing.vHuge,
          AppButton(label: 'Create Account', onPressed: () {}),

          context.spacing.vMd,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppText('Already have an account?'),
              context.spacing.hSm,
              GestureDetector(
                onTap: () {},
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
