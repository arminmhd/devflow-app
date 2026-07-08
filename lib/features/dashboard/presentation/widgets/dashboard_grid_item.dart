import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:devflow/features/dashboard/presentation/widgets/dashboard_card_tile.dart';
import 'package:flutter/material.dart';

class DashboardGridItem extends StatelessWidget {
  final Color color;
  final Color? iconColor;
  final String title;
  final String subTitle;
  final IconData icon;
  const DashboardGridItem({
    super.key,
    required this.color,
    required this.title,
    required this.subTitle,
    required this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardCardTile(
      color: color,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(title),
                context.spacing.vSm,
                AppText(subTitle, maxLines: 2),
              ],
            ),
          ),
          Spacer(),

          Expanded(flex: 1, child: Icon(icon, color: iconColor)),
        ],
      ),
    );
  }
}
