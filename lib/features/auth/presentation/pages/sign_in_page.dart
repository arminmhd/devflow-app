import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_scaffold_widget.dart';
import 'package:devflow/features/auth/presentation/widgets/auth_divider.dart';
import 'package:devflow/features/auth/presentation/widgets/auth_social_buttons.dart';
import 'package:devflow/features/auth/presentation/widgets/sign_in/sign_in_footer.dart';
import 'package:devflow/features/auth/presentation/widgets/sign_in/sign_in_form.dart';
import 'package:devflow/features/auth/presentation/widgets/sign_in/sign_in_info.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isSafeArea: true,
      body: SingleChildScrollView(
        padding: context.padding.screen,
        child: Column(
          children: [
            SignInInfo(),

            context.spacing.vHuge,

            SignInForm(
              usernameController: TextEditingController(),
              passwordController: TextEditingController(),
            ),

            context.spacing.vLg,

            AuthDivider(),

            context.spacing.vHuge,

            AuthSocialButtons(),

            context.spacing.vMd,

            SignInFooter(),
          ],
        ),
      ),
    );
  }
}
