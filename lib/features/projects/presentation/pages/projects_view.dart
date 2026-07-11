import 'package:devflow/features/projects/presentation/widgets/projects-widgets/project_tab_content.dart';
import 'package:devflow/features/projects/presentation/widgets/projects-widgets/projects_search_widget.dart';
import 'package:devflow/features/projects/presentation/widgets/projects-widgets/projects_tab_widget.dart';
import 'package:flutter/material.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: context.padding.screen,
        child: Column(
          children: [
            ProjectsSearchWidget(),

            context.spacing.vLg,

            ProjectsTabWidget(),

            context.spacing.vMd,

            Expanded(child: ProjectTabContent()),
          ],
        ),
      ),
    );
  }
}
