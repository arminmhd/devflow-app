import 'package:devflow/core/design/spacing/app_spaces.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInInfo extends StatelessWidget {
  const SignInInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/logo.png', width: 60.w, height: 60.h),
            AppSpaces.lg,
            AppText('DevFlow', style: context.textTheme.displaySmall),
          ],
        ),

        AppSpaces.lg,

        Text('Welcome back!', style: context.textTheme.headlineMedium),
        AppSpaces.sm,
        Text('Sign in to continue'),
      ],
    );
  }
}
