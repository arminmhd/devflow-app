import 'package:devflow/core/extension/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomNavIcon extends StatelessWidget {
  final String data;
  final bool isActive;
  const AppBottomNavIcon({
    super.key,
    required this.data,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      data,
      width: 25.w,
      height: 25.h,
      fit: BoxFit.cover,
      color: isActive ? context.colors.secondary : context.colors.onPrimary,
    );
  }
}
