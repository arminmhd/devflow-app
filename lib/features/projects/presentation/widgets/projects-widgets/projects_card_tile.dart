import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class ProjectsCardTile extends StatelessWidget {
  const ProjectsCardTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.padding.md,
      margin: context.padding.vSm,
      decoration: BoxDecoration(
        boxShadow: context.shadow.md,
        borderRadius: context.radius.mediumRadius,
        color: context.colors.surfaceContainer,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'DevFlow Mobile App',
                    style: context.textStyle.titleSmall,
                  ),

                  context.spacing.vSm,

                  AppText('Mobile App'),
                ],
              ),

              Spacer(),

              Container(
                padding: context.padding.xs,
                decoration: BoxDecoration(
                  borderRadius: context.radius.smallRadius,
                  color: context.colors.tertiaryContainer.withValues(
                    alpha: 0.3,
                  ),
                ),

                child: AppText(
                  'In Progress',
                  style: context.textStyle.bodyMedium.copyWith(
                    color: context.colors.tertiaryContainer,
                  ),
                ),
              ),
            ],
          ),

          context.spacing.vMd,

          Slider(value: 0, onChanged: (value) {}),

          context.spacing.vMd,

          AppText('Date Created'),
        ],
      ),
    );
  }
}
