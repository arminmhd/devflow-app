import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/design/radius/app_border_radius.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:flutter/material.dart';

class AppErrorBannerWidget extends StatelessWidget {
  final String message;

  const AppErrorBannerWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppInsets.screen,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: context.colors.error,
        borderRadius: AppBorderRadius.sm,
        border: Border.all(color: context.colors.error),
      ),
      child: Text(
        message,
        style: context.textTheme.bodyLarge?.copyWith(
          color: context.colors.error,
        ),
      ),
    );
  }
}
