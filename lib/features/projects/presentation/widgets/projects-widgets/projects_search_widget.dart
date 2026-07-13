import 'package:devflow/core/design/radius/app_border_radius.dart';
import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_input_widget.dart';
import 'package:flutter/material.dart';

class ProjectsSearchWidget extends StatefulWidget {
  const ProjectsSearchWidget({super.key});

  @override
  State<ProjectsSearchWidget> createState() => _ProjectsSearchWidgetState();
}

class _ProjectsSearchWidgetState extends State<ProjectsSearchWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AppInput(
      controller: controller,
      hint: 'Search projects...',
      fillColor: colors.surfaceContainer,
      borderRadius: AppBorderRadius.lg,
      prefixIcon: Icon(Icons.search, color: colors.onSurfaceVariant),
      // onChanged: (value) {
      //   context.read<ProjectsBloc>().add(SearchProjectsEvent(value));
      // },
    );
  }
}
