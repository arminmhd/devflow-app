import 'package:flutter/widgets.dart';

final class AppShadows {
  const AppShadows._();

  static const instance = AppShadows._();

  List<BoxShadow> get sm => const [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 4,
      spreadRadius: 1,
      offset: Offset.zero,
    ),
  ];

  List<BoxShadow> get md => const [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 8,
      spreadRadius: 2,
      offset: Offset.zero,
    ),
  ];

  List<BoxShadow> get lg => const [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 16,
      spreadRadius: 3,
      offset: Offset.zero,
    ),
  ];

  List<BoxShadow> get xl => const [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 24,
      spreadRadius: 4,
      offset: Offset.zero,
    ),
  ];
}
