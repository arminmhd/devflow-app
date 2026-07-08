import 'package:devflow/features/projects/presentation/enum/project_tab_enum.dart';
import 'package:equatable/equatable.dart';

class ProjectsState extends Equatable {
  final ProjectTabEnum selectedTab;

  const ProjectsState({this.selectedTab = ProjectTabEnum.all});

  factory ProjectsState.initial() {
    return ProjectsState(selectedTab: ProjectTabEnum.all);
  }

  ProjectsState copyWith({ProjectTabEnum? selectedTab}) {
    return ProjectsState(selectedTab: selectedTab ?? this.selectedTab);
  }

  @override
  List<Object> get props => [selectedTab];
}
