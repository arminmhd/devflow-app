import 'package:devflow/core/design/radius/app_radius.dart';
import 'package:flutter/widgets.dart';

abstract final class AppBorderRadius {
  static final sm = BorderRadius.circular(AppRadius.sm);

  static final md = BorderRadius.circular(AppRadius.md);

  static final lg = BorderRadius.circular(AppRadius.lg);

  static final xl = BorderRadius.circular(AppRadius.xl);

  static final huge = BorderRadius.circular(AppRadius.huge);

  static final full = BorderRadius.circular(AppRadius.full);

  static const topHuge = BorderRadius.only(
    topLeft: Radius.circular(AppRadius.huge),
    topRight: Radius.circular(AppRadius.huge),
  );
}
