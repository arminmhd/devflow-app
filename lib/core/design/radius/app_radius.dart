import 'package:flutter/widgets.dart';

final class AppRadius {
  const AppRadius._();

  static const instance = AppRadius._();

  static double small = 4.0;
  static double medium = 8.0;
  static double large = 16.0;
  static double extraLarge = 24.0;
  static double huge = 30.0;

  BorderRadius get smallRadius => BorderRadius.circular(small);
  BorderRadius get mediumRadius => BorderRadius.circular(medium);
  BorderRadius get largeRadius => BorderRadius.circular(large);
  BorderRadius get extraLargeRadius => BorderRadius.circular(extraLarge);

  BorderRadius get extraLargeTopRadius => BorderRadius.only(
    topLeft: Radius.circular(huge),
    topRight: Radius.circular(huge),
  );
}
