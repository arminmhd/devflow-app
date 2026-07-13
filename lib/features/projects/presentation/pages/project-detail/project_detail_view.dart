import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/design/spacing/app_spaces.dart';
import 'package:devflow/core/widgets/app_scaffold_widget.dart';
import 'package:devflow/features/projects/presentation/widgets/project-detail-widgets/project_detail_header.dart';
import 'package:devflow/features/projects/presentation/widgets/project-detail-widgets/project_detail_tab_bar.dart';
import 'package:flutter/material.dart';

class ProjectDetailView extends StatelessWidget {
  const ProjectDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isSafeArea: true,
      body: Padding(
        padding: AppInsets.screen,
        child: Column(
          children: [
            ProjectDetailHeader(),

            AppSpaces.lg,

            ProjectDetailTabBar(),
          ],
        ),
      ),
    );
  }
}
