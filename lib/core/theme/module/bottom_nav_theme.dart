import 'package:flutter/material.dart';

BottomNavigationBarThemeData bottomNavigationBarTheme(ColorScheme colors) {
  return BottomNavigationBarThemeData(
    backgroundColor: colors.surface,
    elevation: 0,

    type: BottomNavigationBarType.fixed,

    selectedItemColor: colors.primary,
    unselectedItemColor: colors.onSurfaceVariant,

    selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),

    unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),

    showSelectedLabels: true,
    showUnselectedLabels: true,
  );
}
