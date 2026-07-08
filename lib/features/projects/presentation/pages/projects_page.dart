import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/features/projects/presentation/bloc/projects_bloc.dart';
import 'package:devflow/features/projects/presentation/bloc/projects_state.dart';
import 'package:devflow/features/projects/presentation/widgets/projects-widgets/project_tab_content.dart';
import 'package:devflow/features/projects/presentation/widgets/projects-widgets/projects_search_widget.dart';
import 'package:devflow/features/projects/presentation/widgets/projects-widgets/projects_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsBloc, ProjectsState>(
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: context.padding.screen,
            child: Column(
              children: [
                ProjectsSearchWidget(),

                context.spacing.vLg,

                ProjectsTabWidget(selectedTab: state.selectedTab),

                context.spacing.vMd,

                Expanded(child: ProjectTabContent()),
              ],
            ),
          ),
        );
      },
    );
  }
}
