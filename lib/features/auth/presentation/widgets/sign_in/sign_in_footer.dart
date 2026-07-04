import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText('Dont have an account?'),
        context.spacing.hSm,

        GestureDetector(
          onTap: () {},
          child: AppText(
            'Sign Up',
            style: context.textStyle.bodyLarge.copyWith(
              color: context.colors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
