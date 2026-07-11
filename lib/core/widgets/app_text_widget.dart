import 'package:devflow/core/extension/app_extensions.dart';
import 'package:flutter/widgets.dart';

class AppText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overFlow;

  const AppText(
    this.data, {
    super.key,
    this.style,
    this.align,
    this.maxLines,
    this.overFlow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style ?? context.textTheme.bodyMedium,
      textAlign: align,
      maxLines: maxLines,
      overflow: overFlow ?? TextOverflow.ellipsis,
    );
  }
}
