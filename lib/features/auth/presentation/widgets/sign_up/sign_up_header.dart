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
        context.spacing.vLg,
        AppText('Create Account', style: context.textStyle.headlineLarge),
        context.spacing.vSm,
        AppText('Lets get you started', style: context.textStyle.bodyLarge),
      ],
    );
  }
}
