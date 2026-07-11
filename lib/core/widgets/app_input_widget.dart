import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/design/radius/app_border_radius.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final bool obscure;
  final Color? fillColor;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final BorderRadius? borderRadius;
  final BorderSide? border;

  const AppInput({
    super.key,
    required this.controller,
    this.hint,
    this.obscure = false,
    this.fillColor,
    this.prefixIcon,
    this.validator,
    this.borderRadius,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: validator,

      style: context.textTheme.bodyLarge,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hint,
        hintStyle: context.textTheme.bodyLarge?.copyWith(
          color: context.colors.onSurface.withValues(alpha: 0.6),
        ),
        contentPadding: AppInsets.lg,
        filled: true,
        fillColor: fillColor ?? context.colors.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? AppBorderRadius.md,
          borderSide: border ?? BorderSide(color: context.colors.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? AppBorderRadius.md,
          borderSide: border ?? BorderSide(color: context.colors.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? AppBorderRadius.md,
          borderSide: BorderSide(color: context.colors.primary),
        ),
      ),
    );
  }
}
