import 'package:devflow/features/projects/domain/entities/project_entitiy.dart';
import 'package:devflow/features/projects/domain/enum/project_status.dart';
import 'package:devflow/features/projects/domain/enum/project_tab.dart';

extension FilterProjectsExtension on List<ProjectEntity> {
  List<ProjectEntity> filterByTab(ProjectTab tab) {
    switch (tab) {
      case ProjectTab.all:
        return this;

      case ProjectTab.active:
        return where(
          (project) => project.status == ProjectStatus.active,
        ).toList();

      case ProjectTab.completed:
        return where(
          (project) => project.status == ProjectStatus.completed,
        ).toList();

      case ProjectTab.archived:
        return where(
          (project) => project.status == ProjectStatus.archived,
        ).toList();
    }
  }
}
