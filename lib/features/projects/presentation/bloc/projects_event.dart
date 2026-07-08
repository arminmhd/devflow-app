import 'package:devflow/features/projects/presentation/enum/project_tab_enum.dart';

abstract class ProjectsEvent {}

class ProjectTabChanged extends ProjectsEvent {
  final ProjectTabEnum tab;

  ProjectTabChanged(this.tab);
}
