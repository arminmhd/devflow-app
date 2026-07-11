import 'package:devflow/core/design/spacing/app_spacing.dart';
import 'package:flutter/widgets.dart';

abstract final class AppSpaces {
  static const xs = SizedBox(width: AppSpacing.xs, height: AppSpacing.xs);

  static const sm = SizedBox(width: AppSpacing.sm, height: AppSpacing.sm);

  static const md = SizedBox(width: AppSpacing.md, height: AppSpacing.md);

  static const lg = SizedBox(width: AppSpacing.lg, height: AppSpacing.lg);

  static const xl = SizedBox(width: AppSpacing.xl, height: AppSpacing.xl);

  static const vMd = SizedBox(height: AppSpacing.md);

  static const hMd = SizedBox(width: AppSpacing.md);
}
