import 'package:flutter/widgets.dart';

abstract final class AppShadows {
  static const sm = <BoxShadow>[
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 4,
      spreadRadius: 1,
      offset: Offset.zero,
    ),
  ];

  static const md = <BoxShadow>[
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 8,
      spreadRadius: 2,
      offset: Offset.zero,
    ),
  ];

  static const lg = <BoxShadow>[
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 16,
      spreadRadius: 3,
      offset: Offset.zero,
    ),
  ];

  static const xl = <BoxShadow>[
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 24,
      spreadRadius: 4,
      offset: Offset.zero,
    ),
  ];
}
