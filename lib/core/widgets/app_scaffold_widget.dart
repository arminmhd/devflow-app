import 'package:devflow/core/extension/app_extensions.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigation;
  final bool? isSafeArea;
  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigation,
    this.isSafeArea,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: appBar,
      body: isSafeArea! ? SafeArea(child: body) : body,
      bottomNavigationBar: bottomNavigation,
    );
  }
}
