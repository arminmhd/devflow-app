import 'package:devflow/features/projects/domain/entities/project_entitiy.dart';
import 'package:devflow/features/projects/presentation/enum/project_tab_enum.dart';
import 'package:equatable/equatable.dart';

class ProjectsState extends Equatable {
  final ProjectTabEnum selectedTab;
  final String? error;
  final List<ProjectEntity> projects;
  final bool isLoading;

  const ProjectsState({
    this.selectedTab = ProjectTabEnum.all,
    this.error,
    required this.projects,
    required this.isLoading,
  });

  factory ProjectsState.initial() {
    return const ProjectsState(
      selectedTab: ProjectTabEnum.all,
      projects: [],
      error: null,
      isLoading: false,
    );
  }

  ProjectsState copyWith({
    ProjectTabEnum? selectedTab,
    bool? isLoading,
    String? error,
    List<ProjectEntity>? projects,
  }) {
    return ProjectsState(
      selectedTab: selectedTab ?? this.selectedTab,
      projects: projects ?? this.projects,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [selectedTab, isLoading, projects, error];
}
