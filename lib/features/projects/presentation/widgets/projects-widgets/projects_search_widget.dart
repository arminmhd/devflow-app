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
    return AppInput(
      controller: controller,
      fillColor: context.colors.surfaceContainer,
      hint: 'Search projects...',
      prefixIcon: const Icon(Icons.search),
      borderRadius: AppBorderRadius.lg,
      // onChanged: (value) {
      //   context.read<ProjectsBloc>().add(SearchProjectsEvent(value));
      // },
    );
  }
}
