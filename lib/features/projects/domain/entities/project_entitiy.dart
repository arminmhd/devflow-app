import 'package:devflow/features/projects/domain/enum/project_status.dart';
import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  final int id;
  final String title;
  final String subtitle;
  final ProjectStatus status;
  final String color;
  final int progress;
  final int tasksCount;
  final int completedTasks;
  final DateTime createdAt;

  const ProjectEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.color,
    required this.progress,
    required this.tasksCount,
    required this.completedTasks,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    subtitle,
    status,
    color,
    progress,
    tasksCount,
    completedTasks,
    createdAt,
  ];
}
