import 'package:devflow/app/navigation/appbar_config.dart';
import 'package:devflow/core/widgets/app_bar_widget.dart';
import 'package:devflow/core/widgets/app_bottom_nav.dart';
import 'package:devflow/core/widgets/app_scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationShell extends StatelessWidget {
  final StatefulNavigationShell shell;

  const NavigationShell({super.key, required this.shell});

  @override
  Widget build(BuildContext context) {
    final appBarConfig = getAppBarConfig(shell.currentIndex, context);

    return AppScaffold(
      appBar: AppBarWidget(
        title: appBarConfig.title,
        leading: appBarConfig.leading,
        actions: appBarConfig.actions,
      ),
      body: shell,
      bottomNavigation: AppBottomNav(
        currentIndex: shell.currentIndex,
        onTap: (index) => shell.goBranch(index),
      ),
    );
  }
}
