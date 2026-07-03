import 'package:devflow/core/design/colors/app_colors.dart';
import 'package:flutter/material.dart';

ColorScheme get darkColorScheme {
  return ColorScheme(
    brightness: Brightness.dark,

    primary: AppColors.primary,
    onPrimary: Colors.white,

    secondary: AppColors.secondary,
    onSecondary: Colors.white,

    tertiary: AppColors.grey,
    onTertiary: Colors.white,

    error: AppColors.error,
    onError: Colors.white,

    surface: AppColors.black,
    onSurface: AppColors.white,

    surfaceContainerHighest: AppColors.black.withValues(alpha: 0.9),

    outline: AppColors.grey.withValues(alpha: 0.3),
    shadow: Colors.black.withValues(alpha: 0.4),
  );
}
