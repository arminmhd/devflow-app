import 'package:devflow/core/extension/app_extensions.dart';
import 'package:flutter/material.dart';

class AppErrorBannerWidget extends StatelessWidget {
  final String message;

  const AppErrorBannerWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: context.padding.screen,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: context.colors.error,
        borderRadius: context.radius.smallRadius,
        border: Border.all(color: context.colors.error),
      ),
      child: Text(
        message,
        style: context.textStyle.bodyLarge.copyWith(
          color: context.colors.error,
        ),
      ),
    );
  }
}
