import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_button_widget.dart';
import 'package:devflow/core/widgets/app_input_widget.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  const SignInForm({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          AppInput(
            controller: usernameController,
            hint: 'Email or Username',
            fillColor: context.colors.onPrimary.withValues(alpha: .09),
            prefixIcon: Icon(Icons.person),
          ),

          context.spacing.vMd,

          AppInput(
            controller: passwordController,
            hint: 'password',
            obscure: true,
            fillColor: context.colors.onPrimary.withValues(alpha: .09),
            prefixIcon: Icon(Icons.lock),
          ),

          context.spacing.vLg,

          Align(
            alignment: Alignment.centerRight,
            child: InkWell(onTap: () {}, child: Text('Forgot Password?')),
          ),

          context.spacing.vLg,

          AppButton(label: 'Sign In', onPressed: () {}),
        ],
      ),
    );
  }
}
