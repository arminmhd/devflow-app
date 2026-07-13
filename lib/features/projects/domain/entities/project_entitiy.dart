import 'package:devflow/features/projects/domain/enum/project_status.dart';
import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  final int id;
  final String title;
  final String subtitle;
  final ProjectStatus status;
  final String color;
  final int progress;
  final DateTime createdAt;

  const ProjectEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.color,
    required this.progress,
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
    createdAt,
  ];
}
