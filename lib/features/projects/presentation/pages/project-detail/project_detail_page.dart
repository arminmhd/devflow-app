import 'package:devflow/app/di/service_locator.dart';
import 'package:devflow/features/projects/presentation/bloc/project-detail/project_detail_bloc.dart';
import 'package:devflow/features/projects/presentation/pages/project-detail/project_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectDetailPage extends StatelessWidget {
  final int projectId;
  const ProjectDetailPage({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProjectDetailBloc>(
      create: (context) => sl<ProjectDetailBloc>(),

      child: ProjectDetailView(),
    );
  }
}
