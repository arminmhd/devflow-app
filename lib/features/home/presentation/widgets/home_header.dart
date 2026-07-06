import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: Image.asset(
            'assets/icons/drawer.png',
            width: 25.w,
            height: 25.h,
            color: context.colors.onPrimary,
            fit: BoxFit.cover,
          ),
        ),

        context.spacing.hMd,

        AppText('Dashboard', style: context.textStyle.titleLarge),

        Spacer(),

        InkWell(child: Icon(Icons.notifications)),
      ],
    );
  }
}
