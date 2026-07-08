import 'package:devflow/core/design/colors/app_colors.dart';
import 'package:flutter/material.dart';

ColorScheme get lightColorScheme {
  return ColorScheme(
    brightness: Brightness.light,

    primary: AppColors.primary,
    onPrimary: Colors.black,

    secondary: AppColors.secondary,
    onSecondary: Colors.black,

    tertiary: AppColors.grey,
    onTertiary: Colors.black,

    error: AppColors.error,
    onError: Colors.black,

    surface: AppColors.white,
    onSurface: AppColors.black,

    surfaceContainerHighest: AppColors.white.withValues(alpha: 0.9),
    surfaceContainer: AppColors.white.withValues(alpha: 0.8),

    outline: AppColors.grey.withValues(alpha: 0.4),
    shadow: Colors.black.withValues(alpha: 0.1),

    secondaryContainer: AppColors.warning,
    tertiaryContainer: AppColors.success,
  );
}
