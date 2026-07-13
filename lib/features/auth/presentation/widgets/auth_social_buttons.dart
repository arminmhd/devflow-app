import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/design/radius/app_border_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthSocialButtons extends StatelessWidget {
  const AuthSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        _SocialButton(asset: 'assets/icons/google.png'),
        _SocialButton(asset: 'assets/icons/github.png'),
        _SocialButton(asset: 'assets/icons/apple.png', iconColor: Colors.white),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.asset, this.iconColor});

  final String asset;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      borderRadius: AppBorderRadius.full,
      onTap: () {},
      child: Container(
        padding: AppInsets.md,
        decoration: BoxDecoration(
          color: colors.surfaceContainer,
          borderRadius: AppBorderRadius.full,
          border: Border.all(color: colors.outline),
        ),
        child: Image.asset(asset, width: 35.w, height: 35.h, color: iconColor),
      ),
    );
  }
}
