import 'package:devflow/core/extension/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

AppBarConfig getAppBarConfig(int index, BuildContext context) {
  switch (index) {
    case 0:
      return AppBarConfig(
        title: "Dashboard",
        actions: [Icon(Icons.notifications)],
        leading: InkWell(
          child: Center(
            child: SizedBox(
              width: 30.w,
              height: 30.h,
              child: Image.asset(
                'assets/icons/drawer.png',
                color: context.colors.onPrimary,
              ),
            ),
          ),
        ),
      );

    case 1:
      return const AppBarConfig(title: "Projects", actions: [Icon(Icons.add)]);

    case 2:
      return const AppBarConfig(title: "Tasks");

    case 3:
      return const AppBarConfig(title: "Timer");

    case 4:
      return const AppBarConfig(title: "More");

    default:
      return const AppBarConfig(title: "");
  }
}
