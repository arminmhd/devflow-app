import 'package:devflow/core/design/spacing/app_spaces.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/utils/app_auth_validators.dart';
import 'package:devflow/core/widgets/app_button_widget.dart';
import 'package:devflow/core/widgets/app_input_widget.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_event.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final formKey = GlobalKey<FormState>();

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!formKey.currentState!.validate()) return;

    context.read<AuthBloc>().add(
      LoginEvent(emailController.text.trim(), passwordController.text.trim()),
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
                controller: emailController,
                hint: 'Email',
                prefixIcon: const Icon(Icons.person),
                validator: AppAuthValidators.email,
                fillColor: context.colors.onPrimary.withValues(alpha: .09),
              ),

              AppSpaces.vMd,

              AppInput(
                controller: passwordController,
                hint: 'Password',
                obscure: true,
                prefixIcon: const Icon(Icons.lock),
                validator: AppAuthValidators.password,
                fillColor: context.colors.onPrimary.withValues(alpha: .09),
              ),

              AppSpaces.lg,

              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {},
                  child: const Text('Forgot Password?'),
                ),
              ),

              AppSpaces.lg,

              AppButton(
                label: 'Sign In',
                loading: state.loading,
                onPressed: state.loading ? null : _submit,
              ),
            ],
          ),
        );
      },
    );
  }
}
