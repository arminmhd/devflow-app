import 'package:flutter/material.dart';

class DashboardCardTile extends StatelessWidget {
  final Color? color;
  final Widget? child;
  const DashboardCardTile({super.key, this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.padding.md,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: context.shadow.sm,
        borderRadius: context.radius.largeRadius,
        color: color,
      ),
      child: child,
    );
  }
}
