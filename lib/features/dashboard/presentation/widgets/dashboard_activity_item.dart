import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/design/spacing/app_spaces.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/utils/formatter.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:devflow/features/dashboard/domain/entities/recent_activity_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeActivityItem extends StatelessWidget {
  const HomeActivityItem({super.key, required this.activity});

  final RecentActivityEntity activity;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: AppInsets.vSm,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.history, size: 26.w, color: colors.primary),

          AppSpaces.hMd,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(activity.title, style: context.textTheme.bodyLarge),

                AppSpaces.sm,

                AppText(
                  activity.description ?? '',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          AppSpaces.sm,

          AppText(
            Formatters.timeAgo(activity.timestamp),
            align: TextAlign.right,
            style: context.textTheme.bodySmall?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
