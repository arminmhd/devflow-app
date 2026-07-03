import 'package:flutter/widgets.dart';

final class AppSpaces {
  const AppSpaces._();

  static const instance = AppSpaces._();

  // Values
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 20.0;
  static const double xl = 24.0;
  static const double xxl = 30.0;
  static const double xxxl = 48.0;
  static const double huge = 64.0;

  // Square spaces
  Widget get xsSpace => const SizedBox(width: xs, height: xs);
  Widget get smSpace => const SizedBox(width: sm, height: sm);
  Widget get mdSpace => const SizedBox(width: md, height: md);
  Widget get lgSpace => const SizedBox(width: lg, height: lg);
  Widget get xlSpace => const SizedBox(width: xl, height: xl);
  Widget get xxlSpace => const SizedBox(width: xxl, height: xxl);
  Widget get xxxlSpace => const SizedBox(width: xxxl, height: xxxl);
  Widget get hugeSpace => const SizedBox(width: huge, height: huge);

  // Vertical
  Widget get vXs => const SizedBox(height: xs);
  Widget get vSm => const SizedBox(height: sm);
  Widget get vMd => const SizedBox(height: md);
  Widget get vLg => const SizedBox(height: lg);
  Widget get vXl => const SizedBox(height: xl);
  Widget get vXxl => const SizedBox(height: xxl);
  Widget get vXxxl => const SizedBox(height: xxxl);
  Widget get vHuge => const SizedBox(height: huge);

  // Horizontal
  Widget get hXs => const SizedBox(width: xs);
  Widget get hSm => const SizedBox(width: sm);
  Widget get hMd => const SizedBox(width: md);
  Widget get hLg => const SizedBox(width: lg);
  Widget get hXl => const SizedBox(width: xl);
  Widget get hXxl => const SizedBox(width: xxl);
  Widget get hXxxl => const SizedBox(width: xxxl);
  Widget get hHuge => const SizedBox(width: huge);
}
