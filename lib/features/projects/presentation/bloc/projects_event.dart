import 'package:devflow/features/projects/presentation/enum/project_tab_enum.dart';

abstract class ProjectsEvent {
  const ProjectsEvent();
}

class ProjectTabChanged extends ProjectsEvent {
  final ProjectTabEnum tab;

  const ProjectTabChanged(this.tab);
}

class LoadProjectsEvent extends ProjectsEvent {
  const LoadProjectsEvent();
}

class RefreshProjectsEvent extends ProjectsEvent {
  const RefreshProjectsEvent();
}
