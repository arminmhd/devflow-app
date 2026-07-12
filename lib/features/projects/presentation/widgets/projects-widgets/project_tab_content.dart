import 'package:devflow/core/design/colors/app_colors.dart';
import 'package:devflow/core/design/insets/app_insets.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:devflow/features/projects/presentation/bloc/projects_bloc.dart';
import 'package:devflow/features/projects/presentation/bloc/projects_state.dart';
import 'package:devflow/features/projects/presentation/widgets/projects-widgets/projects_card_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectTabContent extends StatelessWidget {
  const ProjectTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsBloc, ProjectsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.error != null) {
          return Center(
            child: AppText(
              state.error!,
              style: context.textTheme.bodyLarge?.copyWith(
                color: AppColors.error,
              ),
            ),
          );
        }

        final projects = state.filteredProjects;

        if (projects.isEmpty) {
          return const Center(child: AppText("No projects found"));
        }

        return ListView.builder(
          padding: AppInsets.sm,
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];

            return ProjectsCardTile(project: project);
          },
        );
      },
    );
  }
}
