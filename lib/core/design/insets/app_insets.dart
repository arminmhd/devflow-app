import 'package:flutter/widgets.dart';

abstract final class AppInsets {
  const AppInsets._();

  // All
  static const xs = EdgeInsets.all(4);
  static const sm = EdgeInsets.all(8);
  static const md = EdgeInsets.all(12);
  static const lg = EdgeInsets.all(16);
  static const xl = EdgeInsets.all(24);

  // Screen
  static const screen = EdgeInsets.all(28);

  // Horizontal
  static const hSm = EdgeInsets.symmetric(horizontal: 8);
  static const hMd = EdgeInsets.symmetric(horizontal: 12);
  static const hLg = EdgeInsets.symmetric(horizontal: 16);
  static const hXl = EdgeInsets.symmetric(horizontal: 24);
  static const screenH = EdgeInsets.symmetric(horizontal: 28);

  // Vertical
  static const vSm = EdgeInsets.symmetric(vertical: 8);
  static const vMd = EdgeInsets.symmetric(vertical: 12);
  static const vLg = EdgeInsets.symmetric(vertical: 16);
  static const vXl = EdgeInsets.symmetric(vertical: 24);
  static const screenV = EdgeInsets.symmetric(vertical: 28);
}
