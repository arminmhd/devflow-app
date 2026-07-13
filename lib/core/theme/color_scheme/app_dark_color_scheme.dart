import 'package:devflow/core/design/colors/app_colors.dart';
import 'package:flutter/material.dart';

ColorScheme get darkColorScheme {
  return ColorScheme(
    brightness: Brightness.dark,

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
    surface: const Color(0xFF111827),
    onSurface: Colors.white,

    surfaceContainerLowest: const Color(0xFF0F172A),
    surfaceContainerLow: const Color(0xFF172033),
    surfaceContainer: const Color(0xFF1F2937),
    surfaceContainerHigh: const Color(0xFF273449),
    surfaceContainerHighest: const Color(0xFF334155),

    // Outline
    outline: const Color(0xFF475569),
    outlineVariant: const Color(0xFF334155),

    // Shadow
    shadow: Colors.black54,

    // Containers
    primaryContainer: const Color(0xFF3730A3),
    onPrimaryContainer: Colors.white,

    secondaryContainer: const Color(0xFF164E63),
    onSecondaryContainer: Colors.white,

    tertiaryContainer: const Color(0xFF5B21B6),
    onTertiaryContainer: Colors.white,

    errorContainer: const Color(0xFF7F1D1D),
    onErrorContainer: Colors.white,

    // Other
    inverseSurface: const Color(0xFFF8FAFC),
    onInverseSurface: const Color(0xFF0F172A),

    inversePrimary: const Color(0xFF818CF8),

    scrim: Colors.black54,
  );
}
