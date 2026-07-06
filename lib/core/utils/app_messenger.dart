import 'package:devflow/core/design/colors/app_colors.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class AppMessenger {
  static final GlobalKey<ScaffoldMessengerState> key =
      GlobalKey<ScaffoldMessengerState>();

  static void showSnack(String message) {
    key.currentState?.showSnackBar(SnackBar(content: AppText(message)));
  }

  static void showError(String message, BuildContext context) {
    key.currentState?.showSnackBar(
      SnackBar(
        content: AppText(
          message,
          style: context.textStyle.titleMedium.copyWith(
            color: context.colors.onPrimary,
          ),
        ),
        backgroundColor: AppColors.error,
      ),
    );
  }

  static void showSuccess(String message, BuildContext context) {
    key.currentState?.showSnackBar(
      SnackBar(
        content: AppText(
          message,
          style: context.textStyle.titleMedium.copyWith(
            color: context.colors.onPrimary,
          ),
        ),
        backgroundColor: AppColors.success,
      ),
    );
  }
}
