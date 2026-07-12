import 'package:devflow/app/di/service_locator.dart';
import 'package:devflow/features/projects/presentation/bloc/projects_bloc.dart';
import 'package:devflow/features/projects/presentation/bloc/projects_event.dart';
import 'package:devflow/features/projects/presentation/pages/projects_view.dart';
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
    return BlocProvider(
      create: (_) => sl<ProjectsBloc>()..add(const LoadProjectsEvent()),
      child: const ProjectsView(),
    );
  }
}
