import 'package:devflow/features/projects/domain/entities/project_entitiy.dart';
import 'package:devflow/features/projects/domain/enum/project_tab.dart';
import 'package:devflow/features/projects/domain/extension/filter_projects_extension.dart';
import 'package:equatable/equatable.dart';

class ProjectsState extends Equatable {
  final ProjectTab selectedTab;
  final String? error;
  final List<ProjectEntity> projects;
  final bool isLoading;

  const ProjectsState({
    this.selectedTab = ProjectTab.all,
    this.error,
    required this.projects,
    required this.isLoading,
  });

  List<ProjectEntity> get filteredProjects {
    return projects.filterByTab(selectedTab);
  }

  factory ProjectsState.initial() {
    return const ProjectsState(
      selectedTab: ProjectTab.all,
      projects: [],
      error: null,
      isLoading: false,
    );
  }

  ProjectsState copyWith({
    ProjectTab? selectedTab,
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
