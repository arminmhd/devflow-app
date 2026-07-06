import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:devflow/features/home/presentation/widgets/home_card_tile.dart';
import 'package:flutter/material.dart';

class HomeGridItem extends StatelessWidget {
  final Color color;
  final String title;
  final String subTitle;
  final IconData icon;
  const HomeGridItem({
    super.key,
    required this.color,
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return HomeCardTile(
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

          Expanded(flex: 1, child: Icon(icon)),
        ],
      ),
    );
  }
}
