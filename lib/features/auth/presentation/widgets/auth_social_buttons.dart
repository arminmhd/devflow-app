import 'package:devflow/core/design/colors/app_colors.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthSocialButtons extends StatelessWidget {
  const AuthSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialButtons(context, 'assets/icons/google.png', null),
        _buildSocialButtons(context, 'assets/icons/github.png', null),
        _buildSocialButtons(context, 'assets/icons/apple.png', AppColors.white),
      ],
    );
  }
}

Widget _buildSocialButtons(BuildContext context, path, color) {
  return InkWell(
    child: Container(
      padding: context.padding.md,

      decoration: BoxDecoration(
        color: AppColors.grey.withValues(alpha: .5),

        borderRadius: context.radius.fullRadius,
        border: Border.all(width: 1, color: AppColors.grey),
      ),
      child: Image.asset(path, width: 35.w, height: 35.h, color: color),
    ),
  );
}
