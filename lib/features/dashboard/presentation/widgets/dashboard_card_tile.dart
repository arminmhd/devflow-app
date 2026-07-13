import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/design/radius/app_border_radius.dart';
import 'package:devflow/core/design/shadows/app_shadwos.dart';
import 'package:flutter/material.dart';

class DashboardCardTile extends StatelessWidget {
  final Color? color;
  final Widget? child;
  const DashboardCardTile({super.key, this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppInsets.md,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: AppShadows.md,
        borderRadius: AppBorderRadius.lg,
        color: color,
      ),
      child: child,
    );
  }
}
