import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:devflow/features/projects/domain/entities/project_entitiy.dart';
import 'package:flutter/material.dart';

class ProjectsCardTile extends StatelessWidget {
  final ProjectEntity project;

  const ProjectsCardTile({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.padding.vSm,
      padding: context.padding.md,
      decoration: BoxDecoration(
        borderRadius: context.radius.mediumRadius,
        color: context.colors.surface,
        border: Border.all(
          color: project.isArchived
              ? context.colors.outline
              : context.colors.primary.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          AppText(project.title, style: context.textStyle.titleMedium),

          context.spacing.vXs,

          // Description
          AppText(
            project.description,
            style: context.textStyle.bodyMedium,
            maxLines: 2,
          ),

          context.spacing.vSm,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Color indicator
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Color(_hexToColor(project.color)),
                      shape: BoxShape.circle,
                    ),
                  ),
                  context.spacing.hSm,
                  AppText(
                    project.isArchived ? "Archived" : "Active",
                    style: context.textStyle.bodySmall.copyWith(
                      color: project.isArchived
                          ? context.colors.outline
                          : context.colors.primary,
                    ),
                  ),
                ],
              ),

              // Created date
              AppText(
                _formatDate(project.createdAt),
                style: context.textStyle.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Convert hex string (#FFAA00) to int color
  int _hexToColor(String hex) {
    return int.parse(hex.replaceFirst('#', '0xff'));
  }

  // Format date
  String _formatDate(DateTime date) {
    return "${date.year}/${date.month}/${date.day}";
  }
}
