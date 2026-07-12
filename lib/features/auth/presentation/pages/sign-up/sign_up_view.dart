import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/design/spacing/app_spaces.dart';
import 'package:devflow/features/auth/presentation/widgets/auth_social_buttons.dart';
import 'package:devflow/features/auth/presentation/widgets/sign_up/sign_up_form.dart';
import 'package:devflow/features/auth/presentation/widgets/sign_up/sign_up_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppInsets.screen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SignUpHeader(onBackPressed: () => context.pop()),
          AppSpaces.lg,
          const SignUpForm(),
          AppSpaces.lg,
          const AuthSocialButtons(),
        ],
      ),
    );
  }
}
