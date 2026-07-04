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
            context.spacing.hLg,
            AppText('DevFlow', style: context.textStyle.displaySmall),
          ],
        ),

        context.spacing.vLg,

        Text('Welcome back!', style: context.textStyle.headlineMedium),
        context.spacing.vSm,
        Text('Sign in to continue'),
      ],
    );
  }
}
