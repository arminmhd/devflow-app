import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class HomeActivities extends StatelessWidget {
  const HomeActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AppText('Recent Activity', style: context.textStyle.labelLarge),
            Spacer(),

            InkWell(
              child: AppText(
                'View All',
                style: context.textStyle.bodyLarge.copyWith(
                  color: context.colors.primary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
