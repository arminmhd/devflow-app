import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/design/radius/app_border_radius.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class ProjectDetailHeader extends StatelessWidget {
  const ProjectDetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppText('Title', style: context.textTheme.headlineLarge),
        Container(
          padding: AppInsets.xs,
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.md,
            color: context.colors.secondary.withValues(alpha: .1),
          ),
          child: AppText(
            'In Progress',
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colors.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
