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
          return Center(child: CircularProgressIndicator());
        }

        if (state.projects.isEmpty) {
          return const Center(child: AppText("No projects found"));
        }

        return ListView.builder(
          padding: context.padding.sm,
          itemCount: state.projects.length,
          itemBuilder: (context, index) {
            final project = state.projects[index];
            return ProjectsCardTile(project: project);
          },
        );
      },
    );
  }
}
