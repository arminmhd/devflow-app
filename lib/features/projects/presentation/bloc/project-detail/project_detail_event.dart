import 'package:devflow/features/projects/domain/enum/project_detail_tab.dart';
import 'package:equatable/equatable.dart';

abstract class ProjectDetailEvent extends Equatable {
  const ProjectDetailEvent();
}

class ProjectDetailTabChanged extends ProjectDetailEvent {
  final ProjectDetailTab tab;

  const ProjectDetailTabChanged(this.tab);

  @override
  List<Object?> get props => [tab];
}
