import 'package:devflow/core/extension/app_extensions.dart';
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final bool obscure;

  const AppInput({
    super.key,
    required this.controller,
    this.hint,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: context.textStyle.bodyMedium,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: context.textStyle.bodyMedium.copyWith(
          color: context.colors.onSurface.withValues(alpha: 0.6),
        ),
        contentPadding: context.padding.md,
        filled: true,
        fillColor: context.colors.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: context.radius.mediumRadius,
          borderSide: BorderSide(color: context.colors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: context.radius.mediumRadius,
          borderSide: BorderSide(color: context.colors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: context.radius.mediumRadius,
          borderSide: BorderSide(color: context.colors.primary),
        ),
      ),
    );
  }
}
