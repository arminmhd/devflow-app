import 'package:devflow/core/design/spacing/app_spaces.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class SignInFooter extends StatelessWidget {
  final VoidCallback? onSignUpPressed;
  const SignInFooter({super.key, this.onSignUpPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText('Dont have an account?'),
        AppSpaces.sm,

        GestureDetector(
          onTap: onSignUpPressed,
          child: AppText(
            'Sign Up',
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
