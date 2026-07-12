import 'package:devflow/features/projects/domain/enum/project_tab.dart';

abstract class ProjectsEvent {
  const ProjectsEvent();
}

class ProjectTabChanged extends ProjectsEvent {
  final ProjectTab tab;

  const ProjectTabChanged(this.tab);
}

class LoadProjectsEvent extends ProjectsEvent {
  const LoadProjectsEvent();
}

class RefreshProjectsEvent extends ProjectsEvent {
  const RefreshProjectsEvent();
}
