import 'package:devflow/core/design/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppMessenger {
  static final key = GlobalKey<ScaffoldMessengerState>();

  static void showError(String message) {
    key.currentState?.showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.error),
    );
  }

  static void showSuccess(String message) {
    key.currentState?.showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.success),
    );
  }
}
