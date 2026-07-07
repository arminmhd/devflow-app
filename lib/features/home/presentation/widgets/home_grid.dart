import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/utils/formatter.dart';
import 'package:devflow/features/home/presentation/widgets/home_grid_item.dart';
import 'package:flutter/material.dart';

class HomeGrid extends StatelessWidget {
  final int projectsCount;
  final int tasksToday;
  final int totalTime;
  final double totalIncome;

  const HomeGrid({
    super.key,
    required this.projectsCount,
    required this.tasksToday,
    required this.totalTime,
    required this.totalIncome,
  });

  @override
  Widget build(BuildContext context) {
    final List<HomeGridItem> homeItems = [
      HomeGridItem(
        color: context.colors.outline.withValues(alpha: .40),
        title: projectsCount.toString(),
        subTitle: 'Active projects',
        icon: Icons.list_alt,
        iconColor: context.colors.outline,
      ),
      HomeGridItem(
        color: context.colors.secondaryContainer.withValues(alpha: .40),
        title: Formatters.number(tasksToday),
        subTitle: "Today's Tasks",
        icon: Icons.task_alt,
        iconColor: context.colors.secondaryContainer,
      ),
      HomeGridItem(
        color: context.colors.tertiaryContainer.withValues(alpha: .40),
        title: Formatters.time(totalTime),
        subTitle: "Time Today",
        icon: Icons.timer,
        iconColor: context.colors.tertiaryContainer,
      ),
      HomeGridItem(
        color: context.colors.secondary.withValues(alpha: 0.40),
        title: Formatters.income(totalIncome),
        subTitle: "Income This Month",
        icon: Icons.attach_money,
        iconColor: context.colors.secondary,
      ),
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: homeItems.length,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),

      itemBuilder: (context, index) {
        return homeItems[index];
      },
    );
  }
}
