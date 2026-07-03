import 'package:flutter/widgets.dart';

final class AppShadows {
  const AppShadows._();

  static const instance = AppShadows._();

  List<BoxShadow> get sm => const [
    BoxShadow(color: Color(0x1A000000), blurRadius: 4, offset: Offset(0, 2)),
  ];

  List<BoxShadow> get md => const [
    BoxShadow(color: Color(0x1A000000), blurRadius: 8, offset: Offset(0, 4)),
  ];

  List<BoxShadow> get lg => const [
    BoxShadow(color: Color(0x1A000000), blurRadius: 16, offset: Offset(0, 8)),
  ];

  List<BoxShadow> get xl => const [
    BoxShadow(color: Color(0x1A000000), blurRadius: 24, offset: Offset(0, 12)),
  ];
}
