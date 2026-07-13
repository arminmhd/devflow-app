import 'package:devflow/core/design/colors/app_colors.dart';
import 'package:flutter/material.dart';

ColorScheme get lightColorScheme {
  return ColorScheme(
    brightness: Brightness.light,

    // Brand
    primary: AppColors.primary,
    onPrimary: Colors.white,

    secondary: AppColors.secondary,
    onSecondary: Colors.white,

    tertiary: const Color(0xFF8B5CF6),
    onTertiary: Colors.white,

    // Error
    error: AppColors.error,
    onError: Colors.white,

    // Surface
    surface: Colors.white,
    onSurface: AppColors.black,

    surfaceContainerLowest: const Color(0xFFFFFFFF),
    surfaceContainerLow: const Color(0xFFF8FAFC),
    surfaceContainer: const Color(0xFFF1F5F9),
    surfaceContainerHigh: const Color(0xFFE2E8F0),
    surfaceContainerHighest: const Color(0xFFCBD5E1),

    // Outline
    outline: const Color(0xFFCBD5E1),
    outlineVariant: const Color(0xFFE2E8F0),

    // Shadow
    shadow: Colors.black12,

    // Containers
    primaryContainer: const Color(0xFFE0E7FF),
    onPrimaryContainer: const Color(0xFF312E81),

    secondaryContainer: const Color(0xFFCFFAFE),
    onSecondaryContainer: const Color(0xFF164E63),

    tertiaryContainer: const Color(0xFFEDE9FE),
    onTertiaryContainer: const Color(0xFF5B21B6),

    errorContainer: const Color(0xFFFEE2E2),
    onErrorContainer: const Color(0xFF7F1D1D),

    // Other
    inverseSurface: const Color(0xFF1E293B),
    onInverseSurface: Colors.white,

    inversePrimary: const Color(0xFF818CF8),

    scrim: Colors.black54,
  );
}
