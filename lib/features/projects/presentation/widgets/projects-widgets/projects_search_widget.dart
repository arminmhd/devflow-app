import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_input_widget.dart';
import 'package:flutter/material.dart';

class ProjectsSearchWidget extends StatelessWidget {
  const ProjectsSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppInput(
      controller: TextEditingController(),
      fillColor: context.colors.surfaceContainer,
      hint: 'Search projects...',
      prefixIcon: Icon(Icons.search),
      borderRadius: context.radius.largeRadius,
    );
  }
}
