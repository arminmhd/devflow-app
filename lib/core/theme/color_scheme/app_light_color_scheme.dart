import 'package:devflow/core/design/colors/app_colors.dart';
import 'package:flutter/material.dart';

ColorScheme get lightColorScheme {
  return ColorScheme(
    brightness: Brightness.light,

    primary: AppColors.primary,
    onPrimary: Colors.white,

    secondary: AppColors.secondary,
    onSecondary: Colors.white,

    tertiary: AppColors.grey,
    onTertiary: Colors.white,

    error: AppColors.error,
    onError: Colors.white,

    surface: AppColors.white,
    onSurface: AppColors.black,

    surfaceContainerHighest: AppColors.white.withValues(alpha: 0.9),

    outline: AppColors.grey.withValues(alpha: 0.4),
    shadow: Colors.black.withValues(alpha: 0.1),

    secondaryContainer: AppColors.warning,
    tertiaryContainer: AppColors.success,
  );
}
