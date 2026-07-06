import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/features/home/presentation/widgets/home_grid_item.dart';
import 'package:flutter/material.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HomeGridItem> homeItems = [
      HomeGridItem(
        color: context.colors.outline.withValues(alpha: .10),
        title: "4",
        subTitle: 'Active projects',
        icon: Icons.list_alt,
      ),
      HomeGridItem(
        color: context.colors.secondaryContainer.withValues(alpha: .10),
        title: '12',
        subTitle: "Today's Tasks",
        icon: Icons.task_alt,
      ),
      HomeGridItem(
        color: context.colors.tertiaryContainer.withValues(alpha: .10),
        title: '3h 45m',
        subTitle: "Time Today",
        icon: Icons.timer,
      ),
      HomeGridItem(
        color: context.colors.secondary.withValues(alpha: 0.10),
        title: '2,439',
        subTitle: "Income This Month",
        icon: Icons.attach_money,
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
