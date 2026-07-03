import 'package:devflow/core/theme/color_scheme/app_dark_color_scheme.dart';
import 'package:devflow/core/theme/color_scheme/app_light_color_scheme.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static ThemeData get darkTheme =>
      ThemeData(useMaterial3: true, colorScheme: darkColorScheme);

  static ThemeData get lightTheme =>
      ThemeData(useMaterial3: true, colorScheme: lightColorScheme);
}
