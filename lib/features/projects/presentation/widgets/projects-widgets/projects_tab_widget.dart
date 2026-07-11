import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:devflow/features/projects/presentation/bloc/projects_bloc.dart';
import 'package:devflow/features/projects/presentation/bloc/projects_event.dart';
import 'package:devflow/features/projects/presentation/bloc/projects_state.dart';
import 'package:devflow/features/projects/presentation/enum/project_tab_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsTabWidget extends StatelessWidget {
  const ProjectsTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsBloc, ProjectsState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _projectTabBuilder(
              context,
              title: 'All',
              selectedTab: state.selectedTab,
              tab: ProjectTabEnum.all,
            ),
            _projectTabBuilder(
              context,
              title: 'Active',
              selectedTab: state.selectedTab,
              tab: ProjectTabEnum.active,
            ),
            _projectTabBuilder(
              context,
              title: 'Completed',
              selectedTab: state.selectedTab,
              tab: ProjectTabEnum.completed,
            ),
            _projectTabBuilder(
              context,
              title: 'Archived',
              selectedTab: state.selectedTab,
              tab: ProjectTabEnum.archived,
            ),
          ],
        );
      },
    );
  }
}

Widget _projectTabBuilder(
  BuildContext context, {
  required String title,
  required ProjectTabEnum tab,
  required ProjectTabEnum selectedTab,
}) {
  final isSelected = tab == selectedTab;

  return InkWell(
    onTap: () {
      context.read<ProjectsBloc>().add(ProjectTabChanged(tab));
    },
    child: Container(
      padding: context.padding.md,
      decoration: BoxDecoration(
        borderRadius: context.radius.smallRadius,
        color: isSelected
            ? context.colors.primary.withValues(alpha: 0.03)
            : null,
        border: isSelected
            ? Border(
                bottom: BorderSide(color: context.colors.primary, width: 1),
              )
            : null,
      ),
      child: AppText(
        title,
        style: context.textStyle.titleMedium.copyWith(
          color: isSelected ? context.colors.primary : null,
        ),
      ),
    ),
  );
}
