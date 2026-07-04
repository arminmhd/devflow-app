import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_scaffold_widget.dart';
import 'package:devflow/features/auth/presentation/widgets/sign_up/sign_up_form.dart';
import 'package:devflow/features/auth/presentation/widgets/sign_up/sign_up_header.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isSafeArea: true,
      body: SingleChildScrollView(
        padding: context.padding.screen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SignUpHeader(),
            context.spacing.vLg,
            SignUpForm(
              nameController: TextEditingController(),
              emailController: TextEditingController(),
              userNameController: TextEditingController(),
              passwordController: TextEditingController(),
              confirmPasswordController: TextEditingController(),
            ),
          ],
        ),
      ),
    );
  }
}
