import 'package:devflow/core/extension/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomNavIcon extends StatelessWidget {
  const AppBottomNavIcon({
    super.key,
    required this.data,
    required this.isActive,
  });

  final String data;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Image.asset(
      data,
      width: 20.w,
      height: 20.h,
      fit: BoxFit.cover,
      color: isActive ? colors.primary : colors.onSurfaceVariant,
    );
  }
}
