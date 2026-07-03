import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/design/radius/app_radius.dart';
import 'package:devflow/core/design/shadows/app_shadwos.dart';
import 'package:devflow/core/design/spacing/app_spaces.dart';
import 'package:devflow/core/design/typography/app_typography.dart';
import 'package:flutter/material.dart';

extension AppExtensions on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;

  AppSpaces get spacing => AppSpaces.instance;

  AppShadows get shadow => AppShadows.instance;

  AppTypography get textStyle => AppTypography.instance;

  AppRadius get radius => AppRadius.instance;

  AppInsets get padding => AppInsets.instance;
}
