import 'package:devflow/core/extension/app_extensions.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool loading;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colors.primary,
          foregroundColor: context.colors.onPrimary,
          shadowColor: context.colors.shadow,
          shape: RoundedRectangleBorder(
            borderRadius: context.radius.mediumRadius,
          ),
        ),
        onPressed: loading ? null : onPressed,
        child: loading
            ? const CircularProgressIndicator()
            : Text(label, style: context.textStyle.titleMedium),
      ),
    );
  }
}
