import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingInInfo extends StatelessWidget {
  const SingInInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/logo.png', width: 60.w, height: 60.h),
            context.spacing.hMd,
            AppText('DevFlow', style: context.textStyle.displaySmall),
          ],
        ),

        context.spacing.vMd,

        Text('Welcome back!', style: context.textStyle.headlineMedium),
        context.spacing.vSm,
        Text('Sign in to continue'),
      ],
    );
  }
}
