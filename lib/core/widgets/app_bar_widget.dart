import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;

  const AppBarWidget({super.key, this.title, this.actions, this.leading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppInsets.screenH,
      child: AppBar(
        elevation: 0,
        centerTitle: false,
        title: title != null
            ? AppText(title!, style: context.textTheme.titleLarge)
            : null,
        actions: actions,
        leading: leading,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: context.colors.surface,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
