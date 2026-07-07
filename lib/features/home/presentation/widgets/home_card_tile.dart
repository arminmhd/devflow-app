import 'package:devflow/core/extension/app_extensions.dart';
import 'package:flutter/material.dart';

class HomeCardTile extends StatelessWidget {
  final Color? color;
  final Widget? child;
  const HomeCardTile({super.key, this.color, this.child});

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
