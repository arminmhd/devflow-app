import 'package:flutter/widgets.dart';

final class AppInsets {
  const AppInsets._();

  static const instance = AppInsets._();

  // All
  EdgeInsets get xs => const EdgeInsets.all(4);
  EdgeInsets get sm => const EdgeInsets.all(8);
  EdgeInsets get md => const EdgeInsets.all(12);
  EdgeInsets get lg => const EdgeInsets.all(16);
  EdgeInsets get xl => const EdgeInsets.all(24);

  // Screen
  EdgeInsets get screen => const EdgeInsets.all(16);

  // Horizontal
  EdgeInsets get hSm => const EdgeInsets.symmetric(horizontal: 8);
  EdgeInsets get hMd => const EdgeInsets.symmetric(horizontal: 12);
  EdgeInsets get hLg => const EdgeInsets.symmetric(horizontal: 16);
  EdgeInsets get hXl => const EdgeInsets.symmetric(horizontal: 24);

  // Vertical
  EdgeInsets get vSm => const EdgeInsets.symmetric(vertical: 8);
  EdgeInsets get vMd => const EdgeInsets.symmetric(vertical: 12);
  EdgeInsets get vLg => const EdgeInsets.symmetric(vertical: 16);
  EdgeInsets get vXl => const EdgeInsets.symmetric(vertical: 24);
}
