import 'package:devflow/core/design/spacing/app_spaces.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  final VoidCallback? onBackPressed;
  const SignUpHeader({super.key, this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onBackPressed,
          child: Icon(Icons.arrow_back_ios),
        ),
        AppSpaces.lg,
        AppText('Create Account', style: context.textTheme.headlineLarge),
        AppSpaces.sm,
        AppText('Lets get you started', style: context.textTheme.bodyLarge),
      ],
    );
  }
}
