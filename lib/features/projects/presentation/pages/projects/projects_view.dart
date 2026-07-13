import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/design/spacing/app_spaces.dart';
import 'package:devflow/features/projects/presentation/bloc/project/projects_bloc.dart';
import 'package:devflow/features/projects/presentation/bloc/project/projects_state.dart';
import 'package:devflow/features/projects/presentation/widgets/projects-widgets/project_tab_content.dart';
import 'package:devflow/features/projects/presentation/widgets/projects-widgets/projects_search_widget.dart';
import 'package:devflow/features/projects/presentation/widgets/projects-widgets/projects_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppInsets.screen,
        child: BlocBuilder<ProjectsBloc, ProjectsState>(
          builder: (context, state) {
            return Column(
              children: [
                ProjectsSearchWidget(),

                AppSpaces.lg,

                ProjectsTabWidget(),

                AppSpaces.vMd,

                Expanded(child: ProjectTabContent()),
              ],
            );
          },
        ),
      ),
    );
  }
}
