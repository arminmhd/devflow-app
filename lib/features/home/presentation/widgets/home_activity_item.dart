import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/utils/formatter.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:devflow/features/home/domain/entities/recent_activity_entity.dart';
import 'package:flutter/material.dart';

class HomeActivityItem extends StatelessWidget {
  final RecentActivityEntity activity;

  const HomeActivityItem({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.vSm,
      child: Row(
        children: [
          Icon(Icons.history, size: 22, color: context.colors.primary),

          context.spacing.vMd,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(activity.title, style: context.textStyle.bodyLarge),
                AppText(
                  activity.description,
                  style: context.textStyle.bodySmall.copyWith(
                    color: context.colors.outline,
                  ),
                ),
              ],
            ),
          ),

          AppText(
            Formatters.timeAgo(activity.timestamp),
            style: context.textStyle.bodySmall.copyWith(
              color: context.colors.outline,
            ),
          ),
        ],
      ),
    );
  }
}
