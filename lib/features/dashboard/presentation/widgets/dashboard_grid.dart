import 'package:devflow/core/design/colors/app_colors.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/utils/formatter.dart';
import 'package:devflow/features/dashboard/presentation/widgets/dashboard_grid_item.dart';
import 'package:flutter/material.dart';

class DashboardGrid extends StatelessWidget {
  final int projectsCount;
  final int tasksToday;
  final int totalTime;
  final double totalIncome;

  const DashboardGrid({
    super.key,
    required this.projectsCount,
    required this.tasksToday,
    required this.totalTime,
    required this.totalIncome,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      DashboardGridItem(
        color: context.colors.surfaceContainer,
        title: projectsCount.toString(),
        subTitle: 'Active projects',
        icon: Icons.list_alt,
        iconColor: context.colors.primary,
      ),

      DashboardGridItem(
        color: context.colors.surfaceContainer,
        title: Formatters.number(tasksToday),
        subTitle: "Today's Tasks",
        icon: Icons.task_alt,
        iconColor: context.colors.secondary,
      ),

      DashboardGridItem(
        color: context.colors.surfaceContainer,
        title: Formatters.time(totalTime),
        subTitle: "Time Today",
        icon: Icons.timer,
        iconColor: AppColors.success,
      ),

      DashboardGridItem(
        color: context.colors.surfaceContainer,
        title: Formatters.income(totalIncome),
        subTitle: "Income This Month",
        icon: Icons.attach_money,
        iconColor: AppColors.warning,
      ),
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (_, index) => items[index],
    );
  }
}
