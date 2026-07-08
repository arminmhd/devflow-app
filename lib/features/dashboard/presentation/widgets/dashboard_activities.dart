import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:devflow/features/dashboard/domain/entities/recent_activity_entity.dart';
import 'package:devflow/features/dashboard/presentation/widgets/dashboard_activity_item.dart';
import 'package:flutter/material.dart';

class DashboardActivities extends StatelessWidget {
  final List<RecentActivityEntity> activities;
  const DashboardActivities({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AppText('Recent Activity', style: context.textStyle.labelLarge),
            Spacer(),

            InkWell(
              child: AppText(
                'View All',
                style: context.textStyle.bodyLarge.copyWith(
                  color: context.colors.primary,
                ),
              ),
            ),
          ],
        ),

        context.spacing.vMd,

        if (activities.isEmpty)
          AppText(
            'No recent activity',
            style: context.textStyle.bodyMedium.copyWith(
              color: context.colors.onPrimary,
            ),
          ),

        Expanded(
          child: ListView.builder(
            itemCount: activities.length,
            itemBuilder: (context, index) {
              return HomeActivityItem(activity: activities[index]);
            },
          ),
        ),
      ],
    );
  }
}
