import 'package:devflow/app/router/app_route_names.dart';
import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/design/spacing/app_spaces.dart';
import 'package:devflow/features/auth/presentation/widgets/auth_divider.dart';
import 'package:devflow/features/auth/presentation/widgets/auth_social_buttons.dart';
import 'package:devflow/features/auth/presentation/widgets/sign_in/sign_in_footer.dart';
import 'package:devflow/features/auth/presentation/widgets/sign_in/sign_in_form.dart';
import 'package:devflow/features/auth/presentation/widgets/sign_in/sign_in_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppInsets.screen,
      child: Column(
        children: [
          const SignInInfo(),
          AppSpaces.xl,
          const SignInForm(),
          AppSpaces.lg,
          const AuthDivider(),
          AppSpaces.xl,
          const AuthSocialButtons(),
          AppSpaces.vMd,
          SignInFooter(
            onSignUpPressed: () => context.push(AppRouteNames.signUp),
          ),
        ],
      ),
    );
  }
}
