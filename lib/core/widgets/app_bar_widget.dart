import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final VoidCallback? onLeadingPressed;

  const AppBarWidget({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.onLeadingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppInsets.screenAppBar,
      child: AppBar(
        elevation: 0,
        centerTitle: false,
        title: title != null
            ? AppText(title!, style: context.textTheme.titleLarge)
            : null,
        actions: actions,
        leading: leading != null
            ? IconButton(
                onPressed: onLeadingPressed,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: leading!,
              )
            : null,
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
