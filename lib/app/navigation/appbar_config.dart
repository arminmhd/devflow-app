import 'package:devflow/app/router/app_route_paths.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppBarConfig {
  final String title;
  final List<Widget> actions;
  final Widget? leading;

  const AppBarConfig({
    required this.title,
    this.actions = const [],
    this.leading,
  });
}

AppBarConfig getAppBarConfig(BuildContext context) {
  final location = GoRouterState.of(context).uri.path;

  if (location == AppRoutePaths.home) {
    return AppBarConfig(
      title: "Dashboard",
      actions: [const Icon(Icons.notifications)],
      leading: InkWell(
        child: Center(
          child: SizedBox(
            width: 25.w,
            height: 25.h,
            child: Image.asset(
              'assets/icons/drawer.png',
              color: context.colors.onPrimary,
            ),
          ),
        ),
      ),
    );
  }

  if (location == AppRoutePaths.projects) {
    return const AppBarConfig(title: "Projects", actions: [Icon(Icons.add)]);
  }

  if (location.startsWith('${AppRoutePaths.projects}/')) {
    return AppBarConfig(
      title: "Project Detail",
      actions: [Icon(Icons.more_vert)],
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => context.pop(),
      ),
    );
  }

  if (location == AppRoutePaths.tasks) {
    return const AppBarConfig(title: "Tasks");
  }

  if (location == AppRoutePaths.timer) {
    return const AppBarConfig(title: "Timer");
  }

  if (location == AppRoutePaths.more) {
    return const AppBarConfig(title: "More");
  }

  return const AppBarConfig(title: "");
}
