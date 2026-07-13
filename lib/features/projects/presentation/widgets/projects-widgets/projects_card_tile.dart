import 'package:devflow/app/router/app_route_names.dart';
import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/design/radius/app_border_radius.dart';
import 'package:devflow/core/design/spacing/app_spaces.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:devflow/features/projects/domain/entities/project_entitiy.dart';
import 'package:devflow/features/projects/domain/extension/projects_status_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ProjectsCardTile extends StatelessWidget {
  const ProjectsCardTile({super.key, required this.project});

  final ProjectEntity project;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InkWell(
      borderRadius: AppBorderRadius.md,
      onTap: () {
        context.goNamed(
          AppRouteNames.projectDetail,
          pathParameters: {'id': project.id.toString()},
        );
      },
      child: Container(
        margin: AppInsets.vSm,
        padding: AppInsets.md,
        decoration: BoxDecoration(
          color: colors.surfaceContainer,
          borderRadius: AppBorderRadius.md,
          border: Border.all(color: colors.outline),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(project.title, style: context.textTheme.titleMedium),

            AppSpaces.xs,

            AppText(
              project.description,
              maxLines: 2,
              style: context.textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),

            AppSpaces.sm,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: project.status.color(context),
                        shape: BoxShape.circle,
                      ),
                    ),

                    AppSpaces.sm,

                    AppText(
                      project.status.label,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: project.status.color(context),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                AppText(
                  _formatDate(project.createdAt),
                  style: context.textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy/MM/dd').format(date);
  }
}
