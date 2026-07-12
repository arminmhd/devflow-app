import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/design/radius/app_border_radius.dart';
import 'package:devflow/core/design/spacing/app_spaces.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:devflow/features/projects/domain/entities/project_entitiy.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProjectsCardTile extends StatelessWidget {
  final ProjectEntity project;

  const ProjectsCardTile({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: AppBorderRadius.md,
      onTap: () {},
      child: Container(
        margin: AppInsets.vSm,
        padding: AppInsets.md,
        decoration: BoxDecoration(
          borderRadius: AppBorderRadius.md,
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
            AppText(project.title, style: context.textTheme.titleMedium),

            AppSpaces.xs,

            // Description
            AppText(
              project.description,
              style: context.textTheme.bodyMedium,
              maxLines: 2,
            ),

            AppSpaces.sm,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Color indicator + status
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _safeHexColor(project.color),
                        shape: BoxShape.circle,
                      ),
                    ),
                    AppSpaces.sm,
                    AppText(
                      project.isArchived ? "Archived" : "Active",
                      style: context.textTheme.bodySmall?.copyWith(
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
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Safe hex → Color
  Color _safeHexColor(String hex) {
    try {
      return Color(int.parse(hex.replaceFirst('#', '0xff')));
    } catch (_) {
      return Colors.grey;
    }
  }

  // Format date using intl
  String _formatDate(DateTime date) {
    return DateFormat("yyyy/MM/dd").format(date);
  }
}
