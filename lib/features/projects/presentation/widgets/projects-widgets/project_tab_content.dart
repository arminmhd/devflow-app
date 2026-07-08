import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/features/projects/presentation/widgets/projects-widgets/projects_card_tile.dart';
import 'package:flutter/material.dart';

class ProjectTabContent extends StatelessWidget {
  const ProjectTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: context.padding.sm,
      itemCount: 3,
      itemBuilder: (context, index) {
        return ProjectsCardTile();
      },
    );
  }
}
