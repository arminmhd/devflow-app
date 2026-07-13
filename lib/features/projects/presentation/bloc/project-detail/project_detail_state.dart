import 'package:devflow/features/projects/domain/enum/project_detail_tab.dart';
import 'package:equatable/equatable.dart';

class ProjectDetailState extends Equatable {
  final ProjectDetailTab selectedTab;

  const ProjectDetailState({required this.selectedTab});

  factory ProjectDetailState.initial() {
    return const ProjectDetailState(selectedTab: ProjectDetailTab.overview);
  }

  ProjectDetailState copyWith(ProjectDetailTab? selectedTab) {
    return ProjectDetailState(selectedTab: selectedTab ?? this.selectedTab);
  }

  @override
  List<Object?> get props => [selectedTab];
}
