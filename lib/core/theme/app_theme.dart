import 'package:devflow/core/design/typography/app_typography.dart';
import 'package:devflow/core/theme/color_scheme/app_dark_color_scheme.dart';
import 'package:devflow/core/theme/color_scheme/app_light_color_scheme.dart';
import 'package:devflow/core/theme/module/bottom_nav_theme.dart';

import 'package:flutter/material.dart';

abstract final class AppTheme {
  static ThemeData get lightTheme => _theme(lightColorScheme);

  static ThemeData get darkTheme => _theme(darkColorScheme);

  static ThemeData _theme(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: AppTypography.textTheme,

      // appBarTheme: appBarTheme(colorScheme),
      bottomNavigationBarTheme: bottomNavigationBarTheme(colorScheme),

      // cardTheme: cardTheme(colorScheme),

      // inputDecorationTheme: inputDecorationTheme(colorScheme),
    );
  }
}
